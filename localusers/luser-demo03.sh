#!/bin/bash

echo "Your UID is ${UID}."


if [[ UID -ne 1000 ]]
then
	echo "Your UID does not match 1000."
	exit 1
fi


USER_NAME="$(whoami)"
if [[ "${?}" -ne 0 ]]
then
	echo 'id command did not executed successfully.'
	exit 1
fi
echo "Your name is ${USER_NAME}."

exit 0
