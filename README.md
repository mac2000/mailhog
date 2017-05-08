# MailHog Windows

# Build

TODO describe how to build fresh executable

# Build

```
docker build -t mac2000/mailhog .
```

# Run

```
docker run -it --rm --expose 1025 --expose 8025 --name mailhog mac2000/mailhog
```

# Test

```
$ip = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" mailhog
Send-MailMessage -From foo@acme.com -To bar@acme.com -Subject test -Body test -SmtpServer $ip -Port 1025
```

# Beta

```
docker run -d --name mailhog -p 25:1025 -p 8025:8025 --restart="always" mac2000/mailhog
```

Web UI: http://beta.rabota.ua:8025/

Test: `Send-MailMessage -From foo@acme.com -To bar@acme.com -Subject test -Body test -SmtpServer beta.rabota.ua`

# Publish

```
docker login
docker push mac2000/mailhog:latest
```
