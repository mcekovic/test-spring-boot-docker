FROM openjdk:8-jre-alpine
VOLUME /tmp
VOLUME /var/log
EXPOSE 8080
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY ${DEPENDENCY}/BOOT-INF/classes/*.yml .a
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "-Dspring.profiles.active=docker", "hello.Application"]