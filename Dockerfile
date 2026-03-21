# Folosim imaginea Maven cu JDK 17
FROM maven:3.8.4-openjdk-17

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem pom.xml și fișierele de configurare
COPY pom.xml .
COPY config/app.yaml ./config/

# Copiem sursele test
COPY src ./src

# Construim proiectul fără să rulăm testele
RUN mvn clean install -DskipTests

# Comanda care se rulează când pornește containerul
CMD ["mvn", "test"]