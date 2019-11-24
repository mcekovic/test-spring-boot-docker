FROM adoptopenjdk/openjdk11:alpine-jre
VOLUME /var/log /tmp
EXPOSE 8080 9999
ARG DEPENDENCY=target/dependency
ARG APP=/app
COPY ${DEPENDENCY}/BOOT-INF/lib ${APP}/lib
COPY ${DEPENDENCY}/BOOT-INF/classes ${APP}/classes
COPY ${DEPENDENCY}/META-INF ${APP}/classes/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes/*.properties ${APP}/
ENV JAVA_TOOL_OPTIONS="-Dspring.profiles.active=docker -Xms256m -Xmx256m\
 -XX:+ExplicitGCInvokesConcurrent -Xlog:gc=info:file=/var/log/gc.log:time,tags:filecount=10,filesize=10m\
 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.rmi.port=9999 -Djava.rmi.server.hostname=0.0.0.0 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
WORKDIR "${APP}"
ENTRYPOINT ["java", "-cp", "classes:lib/*", "hello.Application"]