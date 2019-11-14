FROM ubuntu:18.04

RUN mkdir -p /opt/web_app

WORKDIR /opt/web_app

RUN apt-get update
RUN apt-get --yes install htop
RUN apt-get --yes install python3-dev
RUN apt-get --yes install python3-pip
RUN pip3 install Django

COPY . /opt/web_app

EXPOSE 8000/tcp

RUN python3 manage.py migrate

ENTRYPOINT python3 manage.py runserver 0.0.0.0:8000


