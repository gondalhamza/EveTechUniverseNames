default:
	docker build . -t evetech:v1
	docker run --rm evetech:v1

build:
	docker build . -t evetech:v1

run:
	docker run --rm evetech:v1

clean:
	docker image rm evetech:v1 ruby:3.0.3-slim-buster
