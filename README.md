# Simple Airgapped Docker Registry [WIP]

This docker-compose will quickly set up a Docker Registry with the following.
 - docker registry authentication container with sensible default ACL controls based on [docker_auth](https://github.com/Ouwen/docker_auth.git)
 - [official docker registry container](https://docs.docker.com/registry/) 
 - postgres container for storing users
 - (TODO) golang server for managing users
 - (TODO) react frontend

To run this stack, follow the steps below:

### Step 1: Run make 
The make file will create your certs, configure config.yml, and copy your certs to 
docker `certs.d` just enter your domain on prompt
```
make

DOMAIN: <my_domain>
```

### Step 2: Start the stack
```
	docker-compose up
```

## Optional Steps: 

### Add static users
In the `auth_config.yml` file. You can add static users by running
`htpasswd -nB my_password`. `htpasswd` can be installed by running
`sudo apt install apache2-utils`. A test user is added for example.

### Change DB string
The postgres database env is specified in the `docker-compose.yml` file.
This can be changed out to an already running database, and the postgres
server can be turned off.

### Change the data location of the registry by mounting a different volume
Default we mount `$PWD/data:/var/lib/registry`

### Change auth logging location
Default we mount it to `$PWD/logs:/logs`

### Copyright
Copyright 2018 Ouwen Huang
Copyright 2015 Cesanta Software Ltd. for docker auth container.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this software except in compliance with the License.