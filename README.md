# RaiseHub

*Empowering Decentralized Funding, Accelerating Innovation*


## Built with the tools and technologies:

<p align="center">
  <img src="https://img.shields.io/badge/-JSON-black?logo=json" />
  <img src="https://img.shields.io/badge/-Markdown-black?logo=markdown" />
  <img src="https://img.shields.io/badge/-npm-CB3837?logo=npm&logoColor=white" />
  <img src="https://img.shields.io/badge/-JavaScript-F7DF1E?logo=javascript&logoColor=black" />
  <img src="https://img.shields.io/badge/-Cypress-17202C?logo=cypress&logoColor=white" />
  <img src="https://img.shields.io/badge/-Gradle-02303A?logo=gradle&logoColor=white" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/-React-61DAFB?logo=react&logoColor=black" />
  <img src="https://img.shields.io/badge/-Docker-2496ED?logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/-GitHub%20Actions-2088FF?logo=githubactions&logoColor=white" />
  <img src="https://img.shields.io/badge/-Axios-8000FF" />
  <img src="https://img.shields.io/badge/-datefns-FF5E5B" />
</p>


## Decentralized Fundraising Platform

This project is a hybrid web application developed as part of a Bachelor's Thesis. Its goal is to enable the creation and participation in fundraising campaigns using blockchain technology, while maintaining an accessible user experience, even for non-technical users.

It includes:

* Backend with **Java + Spring Boot**
* Frontend with **React + Next.js**
* **MySQL** database
* File storage with **AWS S3**
* Payments via **Ethereum**
* Unit testing with **JUnit**
* Orchestration with **Docker Compose**
* Task automation with **Makefile**

---

## Prerequisites

* [Docker and Docker Compose](https://docs.docker.com/)
* [Node.js and npm](https://nodejs.org/) (only if not using Docker)
* [Java 17+](https://adoptium.net/) (only if not using Docker)
* [Make](https://www.gnu.org/software/make/)

  > On Windows, use `make` via WSL or install it with tools like [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm)

---

## Quick Installation and Run

Clone the repository and launch the full system:

```bash
git clone https://github.com/MateoGlzAlon/blockchain-raisehub-tfg.git
cd blockchain-raisehub-tfg
make provision
```

> **Important:** Before running the system, make sure to properly configure the **required environment variables** in the `docker-compose.yml` file.
> These variables are required by both the `backend` and `frontend`, and include credentials for the database, authentication, cloud storage, and blockchain access.

See the environment variable table below for details.

---

## Running Without `make`

You can also run the system manually using Docker:

```bash
docker compose up --build -d
```

---

## Available Commands (`Makefile`)

| Command                   | Description                                             |
| ------------------------- | ------------------------------------------------------- |
| `make start`              | Starts backend and frontend in development mode         |
| `make start.backend`      | Starts the backend only                                 |
| `make start.frontend`     | Starts the frontend in production mode                  |
| `make start.frontend_dev` | Starts the frontend in development mode                 |
| `make build`              | Builds both backend and frontend                        |
| `make build.backend`      | Builds the backend only                                 |
| `make build.frontend`     | Builds the frontend only                                |
| `make test.backend`       | Runs backend unit and integration tests (JUnit)         |
| `make provision`          | Builds and launches the full system with Docker Compose |

---

## Environment Variables

| Variable                | Service          | Description                                            |
| ----------------------- | ---------------- | ------------------------------------------------------ |
| `AWS_BUCKET_NAME`       | frontend         | Name of the AWS S3 bucket for project image storage.   |
| `AWS_BUCKET_REGION`     | frontend         | Region where the AWS bucket is hosted.                 |
| `AWS_ACCESS_KEY`        | frontend         | Access key for AWS services.                           |
| `AWS_SECRET_ACCESS_KEY` | frontend         | Secret key associated with the AWS access key.         |
| `MYSQL_USERNAME`        | backend          | MySQL database user.                                   |
| `MYSQL_PASSWORD`        | backend          | Password for the MySQL user.                           |
| `JWT_SECRET`            | backend          | JWT secret to decode the auth tokens.                  |


Here’s an improved version of your paragraph with clearer structure, better flow, and a more professional tone:

---

If you’d like to explore the **deployed documentation**, you can visit the [RaiseHub documentation site](https://docs-raisehub.vercel.app/intro).

Everything needed to get started, such as required environment variables, setup instructions, and user guides is already available there and will continue to be updated as the project evolves.
