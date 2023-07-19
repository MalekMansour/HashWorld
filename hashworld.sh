#!/bin/bash

# Function to hash the password
hash_password() {
    local password=$1
    local algorithm=$2
    local hashed_password=""

    case $algorithm in
        "md5")
            hashed_password=$(echo -n "$password" | md5sum | awk '{print $1}')
            ;;
        "sha1")
            hashed_password=$(echo -n "$password" | sha1sum | awk '{print $1}')
            ;;
        "sha224")
            hashed_password=$(echo -n "$password" | sha224sum | awk '{print $1}')
            ;;
        "sha256")
            hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')
            ;;
        "sha384")
            hashed_password=$(echo -n "$password" | sha384sum | awk '{print $1}')
            ;;
        "sha512")
            hashed_password=$(echo -n "$password" | sha512sum | awk '{print $1}')
            ;;
        *)
            echo "Unsupported algorithm: $algorithm"
            exit 1
            ;;
    esac

    echo "Hashed password: $hashed_password"
}

# Function to dehash the password
dehash_password() {
    local hashed_password=$1
    local algorithm=$2
    local password=""

    case $algorithm in
        "md5")
            password=$(echo -n "$hashed_password" | md5sum -d | awk '{print $1}')
            ;;
        "sha1")
            password=$(echo -n "$hashed_password" | sha1sum -d | awk '{print $1}')
            ;;
        "sha224")
            password=$(echo -n "$hashed_password" | sha224sum -d | awk '{print $1}')
            ;;
        "sha256")
            password=$(echo -n "$hashed_password" | sha256sum -d | awk '{print $1}')
            ;;
        "sha384")
            password=$(echo -n "$hashed_password" | sha384sum -d | awk '{print $1}')
            ;;
        "sha512")
            password=$(echo -n "$hashed_password" | sha512sum -d | awk '{print $1}')
            ;;
        *)
            echo "Unsupported algorithm: $algorithm"
            exit 1
            ;;
    esac

    echo "Dehashed password: $password"
}

# Main script
echo "Choose an operation:"
echo "1. Hash password"
echo "2. Dehash password"

read -p "Enter your choice (1 or 2): " choice

case $choice in
    "1")
        read -p "Enter the password to hash: " password
        read -p "Choose an algorithm (md5, sha1, sha224, sha256, sha384, sha512): " algorithm
        hash_password "$password" "$algorithm"
        ;;
    "2")
        read -p "Enter the hashed password: " hashed_password
        read -p "Choose the algorithm used (md5, sha1, sha224, sha256, sha384, sha512): " algorithm
        dehash_password "$hashed_password" "$algorithm"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac
