#!/bin/sh -l

set -eu

SSHPATH="$HOME/.ssh"

if [ ! -d "$SSHPATH" ]
then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]
then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/deploy_key"

echo "$INPUT_COMMAND exit" > $HOME/shell.sh
cat $HOME/shell.sh

sh -c "ssh $INPUT_ARGS -i $SSHPATH/deploy_key -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
