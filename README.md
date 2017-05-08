# MailHog Windows

# Build

Should be done in linux container (but may be in future will be able to reproduce in windows, e.g. there is [golang:nanoserver](https://hub.docker.com/_/golang/) image)

Actually what we are doing here is reproducing build steps taken from original [mailhog](https://hub.docker.com/r/mailhog/mailhog/~/dockerfile/) image

docker run -it --rm -v ${pwd}:/code -e GOOS=windows -e GOARCH=amd64 golang bash -c "go get github.com/mailhog/MailHog; cp /go/bin/windows_amd64/MailHog.exe /code/mailhog2.exe"

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
