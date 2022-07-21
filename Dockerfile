FROM ubuntu:latest

RUN apt update && apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git \
    python3 \
    python3-dev \
    python3.10-venv \
    nodejs \
    npm \
    && git config --global user.email "you@example.com" \
    && git config --global user.name "Your Name"

RUN git clone https://github.com/alexsavio/mookme_sample.git

RUN cd mookme_sample \
    && python3.10 -m venv venv \
    && source venv/bin/activate \
    && cd backend \
    && make deps/install-dev \
    && npm install --global @escape.tech/mookme \
    && npx mookme init --only-hook \
    && npx mookme init --only-hook --added-behaviour pre-commit --skip-types-selection

ENTRYPOINT ["/bin/bash"]