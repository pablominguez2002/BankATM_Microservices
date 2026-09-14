# Le podemos añadir la creacion de topicos y ciertas más cosas - el de Docker Compose esta mejor Hecho
# Recordar que este es herramienta externa

#!/bin/bash
set -e

# 1. Iniciar el contenedor de Kafka
docker compose up -d --force-recreate kafka

# 2. Esperar unos segundos a que el proceso arranque
echo "Iniciando Kafka..."
sleep 5

# 3. Crear el archivo de credenciales de administración
docker compose exec -T kafka bash -c 'cat > /tmp/admin.properties <<EOF
security.protocol=SASL_PLAINTEXT
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="admin" password="admin-password";
EOF'

echo "¡Kafka está listo!"

# 4. Permisos de ESCRITURA para writer-app
MSYS_NO_PATHCONV=1 docker compose exec -T kafka /opt/kafka/bin/kafka-acls.sh --bootstrap-server localhost:9091 \
  --command-config /tmp/admin.properties \
  --add \
  --allow-principal User:writer-app \
  --operation Write \
  --operation Describe \
  --topic ordersTopic

# 5. Permisos de LECTURA para consumer-app (Tópico + Grupo de consumo)
MSYS_NO_PATHCONV=1 docker compose exec -T kafka /opt/kafka/bin/kafka-acls.sh --bootstrap-server localhost:9091 \
  --command-config /tmp/admin.properties \
  --add \
  --allow-principal User:consumer-app \
  --operation Read \
  --operation Describe \
  --topic ordersTopic \
  --group order-group
