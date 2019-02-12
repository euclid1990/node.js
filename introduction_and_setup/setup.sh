#!/usr/bin/env bash

set -e

if [ -z "${1-}" ]; then
  echo "Please input {setup_type} to execute command"
  echo "Example: [binary|docker]"
  echo "Usage: $ bash setup.sh {setup_type}"
  exit;
fi

command_action=${1-}

function binary() {
  # Checking for nvm
  if ! which nvm >/dev/null 2>&1; then
    echo "nvm isn't installed. Installing nvm."
    if ! which curl >/dev/null 2>&1; then
      echo "curl isn't installed. Installing curl."
      apt-get -y install curl
    fi

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi

  echo "Nvm version: $(nvm --version)"
  nvm install node

  echo "Node version: $(node -v)"
  echo "Npm version: $(npm -v)"

  echo "Close and reopen your terminal to start or run the following to use it now:
export NVM_DIR=\"$HOME/.nvm\"
  [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"
  [ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"
  "
}

function dockerEnv() {
  if ! which docker >/dev/null 2>&1; then
    echo "Docker isn't installed. Please install Docker before continue."
    exit
  fi

  containerName="node-env"
  if [ ! "$(docker ps -a -q --filter name=$containerName)" ]; then
    echo "Container isn't exist. Creating"
    docker run -v $(pwd):/var/www/app -w /var/www/app -p 8080:8080 --name $containerName -it node:11 /bin/bash
  else
    echo "Container is already exist. Starting"
    docker start $containerName -i
  fi
}

case "$command_action" in
  "binary")
    binary
    echo "✹✹✹ Node.js has been installed with Node Version Manager ✹✹✹"
    ;;
  "docker")
    dockerEnv
    echo "✹✹✹ Node.js container has been up and running ✹✹✹"
    ;;
  *)
    echo "Unknown action: $command_action"
esac
