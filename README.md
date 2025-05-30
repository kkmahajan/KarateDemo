# 🥋 Karate Framework - API Testing Project

This repository demonstrates the use of the **Karate DSL** for automating API tests. The project is designed for learning purposes and showcases how to set up a Karate framework from scratch, create reusable test scripts, and integrate with Maven.

---

## 📌 What is Karate?

[Karate](https://github.com/karatelabs/karate) is an open-source tool that combines API test-automation, mocks, performance testing, and even UI automation into a single framework. It is simple to use, readable, and powerful for creating automated tests for RESTful APIs.

---

## 📁 Project Structure

## 📁 Project Structure

```
karate-api-testing/
├── src/
│   └── test/
│       └── java/
│           └── examples/
│               ├── features/
│               │   ├── sample.feature
│               │   └── user.feature
│               └── runners/
│                   └── TestRunner.java
├── karate-config.js
├── pom.xml
└── README.md
```




---

## 🛠️ Setup Instructions

### Prerequisites

- Java 8 or higher
- Maven
- An IDE (e.g., IntelliJ IDEA or Eclipse)

## ✨ Key Features

- ✅ **Supports all HTTP methods**: GET, POST, PUT, DELETE
- 🔁 **Data-driven testing**: Use `Examples` for parameterization
- ⚙️ **Global configuration**: Managed via `karate-config.js`
- 🧩 **Reusable feature files and functions**: For modular test design
- 🧪 **Easy integration with Maven**: Run tests using `mvn test`
- 📊 **Rich HTML and JSON reports**: Automatically generated after execution
- 🧵 **Multi-environment support**: Easily switch between dev, QA, and prod
- 🧰 **Assertions and schema validation**: Built-in JSON assertions and matchers
- 📊 **After execution reports are generated in this folder : target/karate-reports/
