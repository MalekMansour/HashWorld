#!/bin/bash

# Display the banner
echo "▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▀▀▄  ▄▀▀▄ ▄▄   ▄▀▀▄    ▄▀▀▄  ▄▀▀▀▀▄   ▄▀▀▄▀▀▀▄  ▄▀▀▀▀▄     ▄▀▀█▄▄"
echo "█  █   ▄▀ ▐ ▄▀ ▀▄ █   ▐ █  █   ▄▀ █   █    ▐  █ █      █ █   █   █ █    █     █ ▄▀   █"
echo "▐  █▄▄▄█    █▄▄▄█    ▀▄   ▐  █▄▄▄█  ▐  █        █ █      █ ▐  █▀▀█▀  ▐    █     ▐ █    █"
echo "   █   █   ▄▀   █ ▀▄   █     █   █    █   ▄    █  ▀▄    ▄▀  ▄▀    █      █        █    █"
echo "  ▄▀  ▄▀  █   ▄▀   █▀▀▀     ▄▀  ▄▀     ▀▄▀ ▀▄ ▄▀    ▀▀▀▀   █     █     ▄▀▄▄▄▄▄▄▀ ▄▀▄▄▄▄▀"
echo " █   █    ▐   ▐    ▐       █   █             ▀             ▐     ▐     █        █     ▐"
echo " ▐   ▐                     ▐   ▐                                       ▐        ▐"

# Function to hash the password
hash_password() {
    local password=$1

    echo "Hashing password: $password"

    echo "md5: $(echo -n "$password" | md5sum | awk '{print $1}')"
    echo "sha1: $(echo -n "$password" | sha1sum | awk '{print $1}')"
    echo "sha224: $(echo -n "$password" | sha224sum | awk '{print $1}')"
    echo "sha256: $(echo -n "$password" | sha256sum | awk '{print $1}')"
    echo "sha384: $(echo -n "$password" | sha384sum | awk '{print $1}')"
    echo "sha512: $(echo -n "$password" | sha512sum | awk '{print $1}')"
}

# Function to dehash the password
dehash_password() {
    local hashed_password=$1

    echo "Dehashing password: $hashed_password"

    echo "md5: $(echo -n "$hashed_password" | md5sum -d | awk '{print $1}')"
    echo "sha1: $(echo -n "$hashed_password" | sha1sum -d | awk '{print $1}')"
    echo "sha224: $(echo -n "$hashed_password" | sha224sum -d | awk '{print $1}')"
    echo "sha256: $(echo -n "$hashed_password" | sha256sum -d | awk '{print $1}')"
    echo "sha384: $(echo -n "$hashed_password" | sha384sum -d | awk '{print $1}')"
    echo "sha512: $(echo -n "$hashed_password" | sha512sum -d | awk '{print $1}')"
}

# Main script
while true; do
    echo
    echo "Main Menu:"
    echo "1. Hash password"
    echo "2. Dehash password"
    echo "3. Exit"

    read -p "Enter your choice (1, 2, or 3): " choice

    case $choice in
        "1")
            read -p "Enter the password to hash: " password
            hash_password "$password"
            ;;
        "2")
            read -p "Enter the hashed password: " hashed_password
            dehash_password "$hashed_password"
            ;;
        "3")
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
