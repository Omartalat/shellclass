#!/bin/bash

# Display the UID and username of user executing the script.
# Display if the user is the root or not.

echo "Your UID is ${UID}"


USER_NAME=$(id -un) # ALER: `id -un`
echo "Your User is ${USER_NAME}"

if [[ UID -gt 0 ]]
then
	echo "You are the root"
else
	echo "You are not the root"
fi

