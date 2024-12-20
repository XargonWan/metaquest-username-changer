#!/bin/bash

# Check if the username was provided as an argument
if [[ -z "$1" ]]; then
    echo "Error: You did not provide a username."
    read -p "Please enter the username: " username
    if [[ -z "$username" ]]; then
        echo "Error: You did not enter a username. Exiting the script."
        exit 1
    fi
else
    username="$1"
fi

echo "Username set to: $username"

# Create JSON files locally
declare -A files=(
    ["user.json"]="{\"username\":\"${username}\"}"
    ["vrmoo.cn.json"]="{\"username\":\"${username}\"}"
    ["qq1091481055.json"]="{\n\t\"username\":\"${username}\"\n\t}"
    ["dollarvr.com.json"]="{\n\t\"username\":\"${username}\"\n\t}"
)

# Create the files
for filename in "${!files[@]}"; do
    echo -e "${files[$filename]}" > "$filename"
    echo "Created the file $filename:"
    cat "$filename"
    echo "--------------------------"
done

# Confirm before uploading
read -p "Do you want to upload these files to the device? (y/n): " confirm
if [[ "$confirm" == "y" ]]; then
    # Upload files to the device
    for filename in "${!files[@]}"; do
        adb push "$filename" /sdcard/
        rm -f "$filename"
        echo "Uploaded and removed the local file: $filename"
    done

    # Update the username in global settings
    adb shell settings put global username "$username"
    echo "Username updated in global settings: $username"
else
    echo "Operation canceled. Files remain saved locally."
fi
