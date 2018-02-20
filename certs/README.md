# Create your certificates

Run the following command in this directory to generate your certs.
Set the env variable to 

```
export MY_DOMAIN=localhost

openssl req \
  -newkey rsa:4096 -nodes -sha256 -subj '/CN=*.$MY_DOMAIN/' -keyout ./domain.key \
  -x509 -days 365 -out ./domain.crt
```

