FROM adsonrodrigues/ubuntu-py3.8

WORKDIR /usr/local/app

ENV DEBIAN_FRONTEND noninteractive
ENV LIBEV_FLAGS=4

RUN apt update -y
RUN apt upgrade -y

RUN apt-get update --fix-missing

## postgres dev symbols
RUN apt-get install -y \
    libpq-dev libffi-dev libssl-dev

RUN apt-get install -y \
    python3 python3-dev python3-pip python3-virtualenv python3-setuptools

RUN echo "alias python=python3" >> ~/.bash_aliases
RUN echo "alias pip=pip3" >> ~/.bash_aliases

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen