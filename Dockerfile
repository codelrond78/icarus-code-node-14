FROM node:16

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git curl
RUN apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /app-ini
COPY start.sh start.sh
RUN chmod u+x start.sh
WORKDIR /app
RUN git clone https://github.com/SteveALee/svelte-code-cypress-project.git .
RUN npm install

CMD ["/app-ini/start.sh"]
