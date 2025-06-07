FROM python:3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y vim git curl wget httpie iputils-ping traceroute dnsutils socat sudo \
                   build-essential cmake patchelf file tmux && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV LANG=en_US.UTF-8

CMD ["bash", "--login"]
