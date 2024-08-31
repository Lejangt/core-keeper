#!/bin/bash
cd /home/container

# Replace startup variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the server with modified startup command
${MODIFIED_STARTUP}
