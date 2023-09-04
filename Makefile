.PHONY: build run setup db-create db-migrate stop down test

# Build the Docker image
build:
	docker-compose build

# Start the application
run:
	docker-compose up

# Set up the application (used typically once during initial setup)
setup: build db-create db-migrate

# Create the database
db-create:
	docker-compose run web rake db:create

# Run database migrations
db-migrate:
	docker-compose run web rake db:migrate

# Stop running containers without removing them
stop:
	docker-compose stop

# Stop running containers and remove them
down:
	docker-compose down

# Run tests
test:
	docker-compose run web rake test

# Open a bash shell inside the container
bash:
	docker-compose run web /bin/bash
