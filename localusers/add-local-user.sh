#!/bin/bash


# Get the username
read -p 'Enter the username: ' USER_NAME
# Get the real name.
read -p 'Enter the real name of the user: ' COMMENT
# Get the password.
read -s -p 'Enter the password: ' PASSWORD
echo

# Create the user with the password.
sudo useradd -c "${COMMENT}" -m "${USER_NAME}"
# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	echo 'failed to create new user.'
	exit 1
fi

# Set the password.
echo "${USER_NAME}:${PASSWORD}" | sudo chpasswd
# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
        echo "failed to add user's password."
        exit 1
fi

# Force password change on first login.
sudo passwd -e "${USER_NAME}"

if [[ "${?}" -ne 0 ]]
then
        echo "Failed to expire the user password."
        exit 1
fi

# Display the username, password, and the host where the user was created.
echo "User ${USER_NAME} has been created successfully."

exit 0
