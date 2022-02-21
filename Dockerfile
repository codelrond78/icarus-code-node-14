FROM node:16

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /app-ini
COPY start.sh start.sh
RUN chmod u+x start.sh
WORKDIR /app
RUN git clone https://github.com/codelrond78/template-svelte-jest.git . 
RUN npm install

CMD ["/app-ini/start.sh"]
