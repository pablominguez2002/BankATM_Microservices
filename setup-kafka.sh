#!/bin/bash

# 1. Start or recreate the Kafka container
docker compose up -d --force-recreate kafka

# 2. Wait until Kafka is fully ready to accept connections
echo "Waiting for Kafka to be ready..."

# 3. Create the Admin credentials file inside the container
until docker compose exec kafka bash -c 'cat < /tmp/admin.properties
security.protocol=SASL_PLAINTEXT
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="admin" password="admin-password";
EOF'

kafka-topics --bootstrap-server localhost:9092 --list > /dev/null 2>&1; do
  sleep 2
done

echo "Kafka is up and running!"

# 4. Apply WRITE permissions for writer-app
docker compose exec kafka kafka-acls --bootstrap-server localhost:9092 \
  --command-config /tmp/admin.properties \
  --add \
  --allow-principal User:writer-app \
  --operation Write \
  --operation Describe \
  --topic ordersTopic

# 5. Apply READ permissions for consumer-app
docker compose exec kafka kafka-acls --bootstrap-server localhost:9092 \
  --command-config /tmp/admin.properties \
  --add \
  --allow-principal User:consumer-app \
  --operation Read \
  --operation Describe \
  --topic ordersTopic

docker compose exec kafka kafka-acls --bootstrap-server localhost:9092 \
  --command-config /tmp/admin.properties \
  --add \
  --allow-principal User:consumer-app \
  --operation Read \
  --group order-group

echo "Kafka ACL permissions configured successfully!"
