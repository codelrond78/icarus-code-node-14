FROM python:3.8-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git curl docker.io
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt install -y nodejs
WORKDIR /app-ini
COPY start.sh start.sh
RUN chmod u+x start.sh
WORKDIR /app
CMD ["/app-ini/start.sh"]
