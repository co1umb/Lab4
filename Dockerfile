FROM maven:3.8.5-jdk-8
COPY ./ ./
RUN mvn clean install
WORKDIR ./hello_bot
CMD mvn -X exec:java -Dexec.mainClass="kpi.acts.appz.bot.hellobot.HelloWorldBot"