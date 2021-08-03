# FROM debian:experimental
# RUN apt-get -y update && apt-get -y install pspg


# FROM python:3.7.0-slim
FROM debian:experimental
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>
# RUN echo "deb http://deb.debian.org/debian buster main" >> /etc/apt/sources.list
RUN apt-get -y update && apt-get -y install libpq-dev build-essential less python python3-pip pspg
# COPY --from=0 /usr/bin/pspg /usr/bin
RUN pip install pgcli
ADD run-pgcli.sh /bin/run-pgcli.sh
ADD pgclirc root/.config/pgcli/config
ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]

