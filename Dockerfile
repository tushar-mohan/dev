FROM python:3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y vim git curl wget httpie iputils-ping traceroute dnsutils socat sudo \
                   build-essential cmake patchelf file tmux environment-modules && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN ARCH=$(uname -m) && \
    case "$ARCH" in \
        x86_64) ARCH=amd64 ;; \
        aarch64) ARCH=arm64 ;; \
        armv7l) ARCH=arm ;; \
        *) echo "Unsupported arch: $ARCH" && exit 1 ;; \
    esac && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

ENV LANG=en_US.UTF-8

CMD ["bash", "--login"]
