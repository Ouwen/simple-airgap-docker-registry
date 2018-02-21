DOMAIN := $(shell bash -c 'read -p "DOMAIN: " pwd; echo $$pwd')

all:
	openssl req \
	  -newkey rsa:4096 -nodes -sha256 -subj '/CN=$(DOMAIN)/' -keyout ./certs/domain.key \
	  -x509 -days 365 -out ./certs/domain.crt

	sed -i -e 's/$${MY_DOMAIN}/$(DOMAIN)/g' ./config/config.yml

	sudo mkdir -p /etc/docker/certs.d/$(DOMAIN)/
	sudo cp ./certs/domain.crt /etc/docker/certs.d/$(DOMAIN)/domain.crt