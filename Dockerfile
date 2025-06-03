FROM tomcat:9-jdk17

# Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Build WAR using Maven (if building inside Docker — optional)
# COPY . /app
# WORKDIR /app
# RUN apt-get update && apt-get install -y maven && mvn clean install -Pprod -DskipTests

# Copy built WAR into Tomcat
COPY reader-web/target/reader-web-*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
