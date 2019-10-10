# HAProxy for Magento2
## Documentation
HAProxy v1.9.x

### Example Usage
`docker-compose.yaml`
```
  haproxy:
    image: wwright/magento2-haproxy
    ports:
     - "80:80"
     - "443:443"
    depends_on:
     - varnish
```

### frontend-http
Listen port 80

Insert Header `X-Forwarded-Proto: http`

301 Redirect HTTP to HTTPS

### frontend-https
Bind port 443

Self Signed SSL Cert

Response Header `Strict-Transport-Security: max-age=31536000; includeSubDomains; preload`

### backend
- hostname: varnish
- port: 80

## Configuration
Default: `CMD ["haproxy","-V","-f","/etc/haproxy/haproxy.cfg"]`

User can override default CMD in `docker-compose.yaml` to inject whatever configs they choose.