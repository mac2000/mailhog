FROM microsoft/nanoserver
MAINTAINER Alexandr Marchenko <marchenko.alexandr@gmail.com>

ADD mailhog.exe .

ENTRYPOINT ["mailhog.exe"]

EXPOSE 1025 8025
