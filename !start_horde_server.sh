#S1x Server Configuration start-up file

#!/bin/bash
_script="$(readlink -f ${BASH_SOURCE[0]})" 
# Delete last component from $_script
_mydir="$(dirname $_script)"
# Name of the config file the server should use.
CFG=server_horde.cfg
# Name of the server shown in the title of the terminal window
NAME="S1X Server"
# Port used by the server (default: 27016)
PORT=27016

echo -e '\033]2;'XLabsS1X - $NAME - Server restart'\007'  ## edits terminal tab title.
echo "Visit xlabs.dev / Join the Discord (sKeVmR3) for NEWS and Updates!"
echo "Server "$NAME" will load $CFG and listen on port $PORT UDP!"
echo "To shut down the server close this window first!"
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" $NAME server started."

while true
do
wine .\\s1x.exe -dedicated +survival 1 +set net_port $PORT +exec $CFG +map_rotate
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" WARNING: $NAME server closed or dropped... server restarting."
sleep 1
done