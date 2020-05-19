DOCKER=docker-compose

up:
	$(DOCKER) up -d --force-recreate
down:
    $(DOCKER) down