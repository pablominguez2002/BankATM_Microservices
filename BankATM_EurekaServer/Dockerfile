# --- Etapa 1: Compilación ---
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copiar el wrapper y los archivos de configuración
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle settings.gradle ./
# Nota: Si usas Groovy en vez de Kotlin DSL, cambia las extensiones a build.gradle y settings.gradle

# Descargar dependencias para aprovechamiento del caché de Docker
RUN ./gradlew dependencies --no-daemon

# Copiar código fuente y generar el JAR ejecutable
COPY src ./src
RUN ./gradlew bootJar --no-daemon -x test

# --- Etapa 2: Ejecución ---
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiar el ejecutable generado en build/libs
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "app.jar"]