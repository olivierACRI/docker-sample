#!/bin/bash
. /.datalab/init.sh

wait_interface & # emit state change to API when the interface is ready

#Create user home directory as a symlink to the user persistent area volume (pending correction related to SEPPPCR-191).
ln -s /media/home /home/$USER
# chmod -R go+rwx /media/home/.local
cd $HOME

debug "Start Python server"

Xvfb :1 &
for f in /opt/datalabs/init.d/*.sh; do
  chown $UID:$UID $f
  chmod u+x $f
  su - $USER -c "bash +euo pipefail -cl \"HOME=/home/$USER $f\""
done

api_emit_running
if su - $USER -c " bash -cl \"HOME=/home/$USER python -m app"
then
  api_emit_finished
else
  api_emit_error
fi

api_emit_if_done
