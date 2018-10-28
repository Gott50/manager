#!/bin/sh
mkdir ~/.ssh
echo $KNOWN_HOSTS > ~/.ssh/known_hosts

echo $SSH_KEY > ./tmp
tr '_' '\n' < ./tmp > ./id_rsa
chmod 600 ./id_rsa
rm ./tmp

echo Manager Parameters: $@
STR=$1
JSON=${STR//'"'/'\"'}
shift

ssh -tt -i ./id_rsa docker@$IP "sh start_bot.sh $JSON $@"