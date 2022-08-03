ARG TAG=3.8.13-slim-buster
FROM python:${TAG}

LABEL maintainer devops@twisto.cz

RUN useradd --user-group --system --create-home --no-log-init unlocker

COPY . /tmp/app

RUN pip3 install /tmp/app

RUN rm -rf /tmp/app

USER unlocker

WORKDIR /data

CMD [ "ssh-unlocker"]