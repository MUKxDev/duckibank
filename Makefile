include .env

# creates a new docker container for the database and runs the container
postgres:
	docker run --name postgres16.3 -p ${DB_PORT}:5432 -e POSTGRES_USER=${DB_USER} -e POSTGRES_PASSWORD=${DB_PASSWORD} -d postgres:16.3-alpine

# creaets a database in the container
createdb:
	docker exec -it postgres16.3 createdb --username=${DB_USER} --owner=${DB_USER} ${DB_NAME}

# drops a database in the container
dropdb:
	docker exec -it postgres16.3 dropdb --username=${DB_USER} ${DB_NAME}

# migrates a database up in the container
migrateup:
	migrate -path db/migration -database 'postgresql://${DB_USER}:${DB_PASSWORD}@localhost:${DB_PORT}/${DB_NAME}?sslmode=disable' -verbose up

# migrates a database down in the container
migratedown:
	migrate -path db/migration -database 'postgresql://${DB_USER}:${DB_PASSWORD}@localhost:${DB_PORT}/${DB_NAME}?sslmode=disable' -verbose down

# generates sqlc for the queries in ./db/query into ./db/sqlc
sqlc:
	sqlc generate


.PHONY: createdb dropdb postgres migrateup migratedown sqlc