# Directories
BACKEND_DIR=backend
FRONTEND_DIR=ui

# Commands
BACKEND_RUN=./gradlew run
BACKEND_BUILD=./gradlew build
BACKEND_TEST=./gradlew test
E2E_TEST=npx cypress run

.PHONY: all start start.backend start.frontend start.frontend_dev build build.backend build.frontend test.backend test.e2e provision deprovision

all: provision

start:
	@echo "== Starting Backend and Frontend =="
	(cd $(BACKEND_DIR) && $(BACKEND_RUN) spring-boot:run) & \
	(cd $(FRONTEND_DIR) && npm run dev)

start.backend:
	@echo "== Starting Backend only =="
	cd $(BACKEND_DIR) && $(BACKEND_RUN) spring-boot:run

start.frontend:
	@echo "== Starting Frontend only =="
	cd $(FRONTEND_DIR) && npm run start

start.frontend_dev:
	@echo "== Starting Frontend (dev) =="
	cd $(FRONTEND_DIR) && npm run dev

build:
	@echo "== Building Backend and Frontend =="
	cd $(BACKEND_DIR) && $(BACKEND_BUILD)
	cd $(FRONTEND_DIR) && npm run build

build.backend:
	@echo "== Building Backend =="
	cd $(BACKEND_DIR) && $(BACKEND_BUILD)

build.frontend:
	@echo "== Building Frontend =="
	cd $(FRONTEND_DIR) && npm run build

test.backend:
	@echo "== Running Backend tests =="
	cd $(BACKEND_DIR) && $(BACKEND_TEST)

test.e2e:
	@echo "== Running Frontend E2E tests =="
	cd $(FRONTEND_DIR) && $(E2E_TEST)

provision:
	@echo "== Starting system with Docker Compose =="
	docker compose up -d --build

deprovision:
	@echo "== Completely tearing down Docker containers, networks, volumes, and images =="
	docker compose down --volumes --rmi all

