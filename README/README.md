<div align="center">

# 🏧 BankATM_Microservices

</div>

> This project simulates a Bank Cash Machine (ATM) ecosystem, offering functionalities such as Cash Deposits and Withdrawals, Bank Transfers, Bizum Payments, User Registration, Order Creation, On-Screen Data Display, Database Updates, and more.

<p align="center">
  <img src="BankATM.jpg" alt="BankATM Architecture" width="600">
</p>

<div align="center">

Read this in: [Español](README.es.md)
[![AGPLv3 License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)](https://www.gnu.org/licenses/agpl-3.0.html)
[![Status](https://img.shields.io/badge/status-active-brightgreen.svg)]()

</div>

## 🎪 Features
- **Feature 1:** REST API Operations (Application Programming Interface).
- **Feature 2:** Fast and Secure User Authentication using OAuth2 (Google).
- **Feature 3:** Microservices Architecture orchestrated by Netflix Eureka.
- **Feature 4:** Request Ingestion and Routing via API Gateway.
- **Feature 5:** Asynchronous Communication via Apache Kafka.
- **Feature 6:** Synchronous Communication via OpenFeign.
- **Feature 7:** Database Connectivity (MySQL).
- **Feature 8:** Containerized Application Deployment using Docker.

## 🛠️ Tech Stack
- **Language:** Java (21-LTS)
- **Framework:** Spring Framework (Spring Boot, Spring Security, Spring Cloud)
- **Database:** MySQL
- **Event Streaming:** Apache Kafka
- **Containerization:** Docker
- **Version Control:** Git

## 📦 Installation & Getting Started

The project consists of a set of integrated internal microservices and applications. You can run and deploy the project in two ways:

1. **Running services individually:** Starting each Java application within your IDE or terminal (*Not recommended*, as it requires all dependencies and database services to be installed locally on your system).
2. **Using Docker:** Deploying the entire ecosystem at once using Docker Compose (*Recommended*, only requires Docker Desktop installed).

### Steps for Installation via Docker

1. **Clone the repository:**  
   `git clone <repository-url>`

2. **Start the Docker Daemon:**  
   Ensure Docker Desktop is open and running.

3. **Navigate to the Project Root Folder:**  
   Make sure you are in the directory containing the `docker-compose.yml` file.

4. **Build and Start Docker Containers:**  
   Run the command:  
   `docker compose up`

<div align="center">

## 🏢 Microservices Architecture

</div>

<p align="center">
  <img src="EstructuraMicroservicios.png" alt="Microservices Architecture Diagram" width="800">
</p>

## 👁️‍🗨️ Testing the Application

First, you must authenticate in the application using your **Google Account**. The application relies exclusively on Google's OAuth2 service for user authentication (OAuth2 Resource Server).

To test the API endpoints, you can execute the following HTTP requests:

- **Get User List:** `(GET) http://localhost:8080/user`
- **Get Order List:** `(GET) http://localhost:8080/order`
- **Create a User:** `(POST) http://localhost:8080/user` *(Include the user object in the request body)*
- **Deposit Cash:** `(PUT) http://localhost:8080/user` *(Include the amount in the request body)*
- **Create an Order:** `(POST) http://localhost:8080/order` *(Include the order details in the request body)*
- **Delete an Order:** `(DELETE) http://localhost:8080/order/{id}` *(Pass the ID as a path variable)*
- **Process an Order:** `(POST) http://localhost:8080/order/process` *(Include the order object in the request body)*

> **Note:** It is recommended to verify that data is updated correctly after executing modifying operations (POST/PUT/DELETE). Also, check your inbox to see if you received notification emails after operations like User Creation or Order Processing.

## ⚙️ Future Enhancements

I plan to introduce major improvements and new technologies to the project:

- **Cloud Deployment:** Deploying the project to the web using **AWS** ☁️
- **AI Integration:** Integrating a terminal-based AI coding agent (**Claude Code**, **OpenCode**) to assist with code maintenance and feature development 🕵️‍♂️
- **Frontend Application:** Developing a user-friendly frontend interface using **TypeScript** with **React** or **Angular** 💻
- **Container Orchestration:** Managing and orchestrating Dockerized microservices with **Kubernetes** 🎹🎻

After achieving these goals, I plan to explore new tools and continue deepening my software engineering skills.
