postgres: 
	docker run --name payment -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=postgres -d postgres:15-alpine

createdb: 
	docker exec -it payment createdb --username=root --owner=root payment 

dropdb: 
	docker exec -it payment dropdb payment 

migrateup: 
	migrate -path db/migrations -database "postgresql://root:postgres@localhost:5432/payment?sslmode=disable" -verbose up 

migratedown: 
	migrate -path db/migrations -database "postgresql://root:postgres@localhost:5432/payment?sslmode=disable" -verbose down

sqlc: 
	sqlc generate 

.PHONY: postgres createdb dropdb migrateup migratedown sqlc