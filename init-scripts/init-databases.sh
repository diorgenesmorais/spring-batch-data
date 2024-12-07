#!/bin/bash
set -e

echo "Creating databases and granting privileges..."

mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS spring_batch;
CREATE DATABASE IF NOT EXISTS app_batch;
GRANT ALL PRIVILEGES ON spring_batch.* TO '${MYSQL_USER}'@'%';
GRANT ALL PRIVILEGES ON app_batch.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Databases created and privileges granted."
