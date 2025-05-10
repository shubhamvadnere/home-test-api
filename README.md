# Home Test API with Karate

## Prerequisites

- Java 8+
- Maven
- Docker

## Run API Locally

```bash
docker pull automaticbytes/demo-app
docker run -p 3100:3100 automaticbytes/demo-app
```

## Run Tests

```bash
mvn test
```

## Project Structure

- `inventory.feature`: Contains all test cases for the API
- `karate-config.js`: Sets the base API URL
