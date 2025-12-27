#!/bin/bash

if [[ "$(whoami)" == "root" ]]; then
  if [ -z "${1}" ]; then
    echo "Ejecuta sudo bash ${0} [interfaz wifi]"
    exit 127
  fi

  while true; do
    echo "Pulsa [ENTER] cada vez que quieras una identidad nueva en esta red."
    read
    ifconfig ${1} down
    macchanger -r ${1}
    ifconfig ${1} up
  done
else
  echo "Ejecuta sudo bash ${0} [interfaz wifi]"
fi