PROJECT = httpx-timeout
NAME = httpx-timeout

build:
	branch=$$(git symbolic-ref --short HEAD | tr / -); \
	docker build --tag $(PROJECT):$$branch .

run:
	branch=$$(git symbolic-ref --short HEAD | tr / -); \
	location=$$(pwd); \
	docker run -it --rm -p 5000:5000 --name $(NAME) -t $(PROJECT):$$branch

logs:
	docker logs $(NAME)

stop:
	docker stop $(NAME)

push:
	branch=$$(git symbolic-ref --short HEAD | tr / -); \
	docker push $(PROJECT):$$branch
