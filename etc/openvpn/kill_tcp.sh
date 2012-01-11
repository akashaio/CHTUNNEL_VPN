#!/bin/bash
KILL_IP=$1
echo "kill $KILL_IP"
telnet localhost 444 << EOF
kill $KILL_IP
exit 
EOF

