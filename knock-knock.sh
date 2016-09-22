#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 ip port1 port2 port3"
  exit;
fi

HOST=$1
shift

# Go through all possible combinations of 3 ports
for PORT_1 in "$@"
do
  for PORT_2 in "$@"
  do
          for PORT_3 in "$@"
          do
              hping3 -S $HOST -p $PORT_1 -c 1 >&2 > /dev/null
              hping3 -S $HOST -p $PORT_2 -c 1 >&2 > /dev/null
              hping3 -S $HOST -p $PORT_3 -c 1 >&2 > /dev/null
          done
  done
done
