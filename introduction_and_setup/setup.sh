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
    echo "Replace this code"
}

function docker() {
    echo "Replace this code"
}

case "$command_action" in
  "binary")
    binary
    echo "✹✹✹ Node.js has been installed with Node Version Manager ✹✹✹"
    ;;
  "docker")
    docker
    echo "✹✹✹ Node.js container has been up and running ✹✹✹"
    ;;
  *)
    echo "Unknown action: $command_action"
esac
