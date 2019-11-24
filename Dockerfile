FROM openjdk:8-jre-alpine
VOLUME /var/log /tmp
EXPOSE 8080 9999
ARG DEPENDENCY=target/dependency
ARG APP=/app
ENV JAVA_TOOL_OPTIONS="-Dspring.profiles.active=docker -Xms256m -Xmx256m -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.rmi.port=9999 -Djava.rmi.server.hostname=black-hole-sun -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
COPY ${DEPENDENCY}/BOOT-INF/lib ${APP}/lib
COPY ${DEPENDENCY}/BOOT-INF/classes ${APP}/classes
COPY ${DEPENDENCY}/META-INF ${APP}/classes/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes/*.yml ${APP}/
WORKDIR "${APP}"
ENTRYPOINT ["java", "-cp", "classes:lib/*", "hello.Application"]