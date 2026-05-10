#!/bin/bash
set -e

SONAR_HOST="http://localhost:9000"
SONAR_ADMIN_PASS="ThisIsNotSecure1234!"
SONAR_AUTH="admin:$SONAR_ADMIN_PASS"
PROJECT_KEY="project-one"
PROJECT_DIR="/Users/mdaeppen/workspace/project-one"
CONTAINER="github-runner-org-zbrainiac-labs-1"
SONAR_TOKEN=$(docker exec "$CONTAINER" bash -c 'tail -1 ~/.sonar_env 2>/dev/null | cut -d= -f2')

echo "=== Recreating SonarQube project ==="
curl -s -o /dev/null -u "$SONAR_AUTH" -X POST "$SONAR_HOST/api/projects/delete" -d "project=$PROJECT_KEY" 2>/dev/null || true
curl -s -o /dev/null -u "$SONAR_AUTH" -X POST "$SONAR_HOST/api/projects/create" -d "project=$PROJECT_KEY&name=$PROJECT_KEY"

echo "=== Re-deploying rules ==="
docker exec "$CONTAINER" bash /usr/local/bin/sonar-rules-setup.sh 2>&1 | tail -2

echo "=== Copying project to container ==="
SCAN_DIR="/tmp/sonar-scan-$$"
docker exec "$CONTAINER" mkdir -p "$SCAN_DIR"
docker exec "$CONTAINER" bash -c "cd $SCAN_DIR && git init && git config user.email 'ci@test.com' && git config user.name 'CI'" > /dev/null 2>&1

for dir in workload sources sqlunit; do
    [ -d "$PROJECT_DIR/$dir" ] && docker cp "$PROJECT_DIR/$dir" "$CONTAINER:$SCAN_DIR/$dir"
done
for file in pre_deploy.sql post_deploy.sql manifest.yml; do
    [ -f "$PROJECT_DIR/$file" ] && docker cp "$PROJECT_DIR/$file" "$CONTAINER:$SCAN_DIR/"
done

docker exec "$CONTAINER" bash -c "cd $SCAN_DIR && find . -name '.DS_Store' -delete 2>/dev/null; git add . && git commit -m 'scan' -q"

echo "=== Running SQLFluff ==="
docker exec "$CONTAINER" bash -c "cd $SCAN_DIR && bash /usr/local/bin/sqlfluff-to-sonar.sh $SCAN_DIR $SCAN_DIR/sqlfluff_issues.json" 2>&1 | tail -2

SQLFLUFF_ARG=""
docker exec "$CONTAINER" test -s "$SCAN_DIR/sqlfluff_issues.json" && SQLFLUFF_ARG="-Dsonar.externalIssuesReportPaths=$SCAN_DIR/sqlfluff_issues.json"

echo "=== Running SonarQube scan ==="
docker exec "$CONTAINER" bash -c "cd $SCAN_DIR && sonar-scanner \
  -Dsonar.projectKey=$PROJECT_KEY \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://sonarqube:9000 \
  -Dsonar.token=$SONAR_TOKEN \
  -Dsonar.sql.dialect=snowflake \
  -Dsonar.text.inclusions='**/*.sql,**/*.json' \
  -Dsonar.exclusions='.git/**,**/*.md,**/*.csv,**/*.yml,**/*.yaml,**/*.ipynb,**/.DS_Store' \
  $SQLFLUFF_ARG \
  -Dsonar.working.directory=$SCAN_DIR/.sonar-work" 2>&1 | grep -E "indexed|SUCCESS|ERROR|Imported|WARN.*choked"

echo ""
echo "=== Results (waiting for analysis to complete) ==="
sleep 3
python3 -c "
import urllib.request, base64, json
AUTH = base64.b64encode(b'admin:$SONAR_ADMIN_PASS').decode()
req = urllib.request.Request('$SONAR_HOST/api/issues/search?componentKeys=$PROJECT_KEY&ps=1&facets=rules')
req.add_header('Authorization', f'Basic {AUTH}')
data = json.loads(urllib.request.urlopen(req).read().decode())
im = {}
for f in data.get('facets', []):
    if f['property'] == 'rules':
        for v in f['values']:
            im[v['val']] = v['count']
txt = sum(v for k,v in im.items() if k.startswith('txt:'))
sqlcc = sum(v for k,v in im.items() if k.startswith('SQLCC:'))
sf = sum(v for k,v in im.items() if 'sqlfluff' in k)
print(f'Total: {data[\"total\"]} | txt: {txt} | SQLCC: {sqlcc} | SQLFluff: {sf}')
print()
zero = [k for k in sorted(im) if im[k] == 0]
if zero:
    print(f'Rules with 0 issues: {len(zero)}')
    for r in zero: print(f'  {r}')
"

echo ""
echo "Dashboard: $SONAR_HOST/dashboard?id=$PROJECT_KEY"
