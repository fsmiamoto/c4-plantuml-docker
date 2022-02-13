# Based on robbell/plantuml-docker :)
FROM openjdk:19-jdk-alpine
ARG PLANTUML_VERSION=1.2022.1
RUN apk add --no-cache graphviz wget ttf-dejavu && \
  wget "https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar" -O plantuml.jar
ENTRYPOINT ["java", "-jar", "plantuml.jar"]
CMD ["-p"]
