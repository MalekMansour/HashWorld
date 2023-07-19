#!/bin/bash

echo "▄▀▀▄ ▄▄   ▄▀▀█▄   ▄▀▀▀▀▄  ▄▀▀▄ ▄▄   ▄▀▀▄    ▄▀▀▄  ▄▀▀▀▀▄   ▄▀▀▄▀▀▀▄  ▄▀▀▀▀▄     ▄▀▀█▄▄"
echo "█  █   ▄▀ ▐ ▄▀ ▀▄ █   ▐ █  █   ▄▀ █   █    ▐  █ █      █ █   █   █ █    █     █ ▄▀   █"
echo "▐  █▄▄▄█    █▄▄▄█    ▀▄   ▐  █▄▄▄█  ▐  █        █ █      █ ▐  █▀▀█▀  ▐    █     ▐ █    █"
echo "   █   █   ▄▀   █ ▀▄   █     █   █    █   ▄    █  ▀▄    ▄▀  ▄▀    █      █        █    █"
echo "  ▄▀  ▄▀  █   ▄▀   █▀▀▀     ▄▀  ▄▀     ▀▄▀ ▀▄ ▄▀    ▀▀▀▀   █     █     ▄▀▄▄▄▄▄▄▀ ▄▀▄▄▄▄▀"
echo " █   █    ▐   ▐    ▐       █   █             ▀             ▐     ▐     █        █     ▐"
echo " ▐   ▐                     ▐   ▐                                       ▐        ▐"
echo "HashWorld v.1.0.3 - Author : Malek Mansour"

hash_password() {
    local password=$1

    echo "Hashing password: $password"

    echo "md5: $(echo -n "$password" | md5sum | awk '{print $1}')"
    echo "sha1: $(echo -n "$password" | sha1sum | awk '{print $1}')"
    echo "sha224: $(echo -n "$password" | sha224sum | awk '{print $1}')"
    echo "sha256: $(echo -n "$password" | sha256sum | awk '{print $1}')"
    echo "sha384: $(echo -n "$password" | sha384sum | awk '{print $1}')"
    echo "sha512: $(echo -n "$password" | sha512sum | awk '{print $1}')"
    echo "ripemd160: $(echo -n "$password" | openssl dgst -ripemd160 | awk '{print $2}')"
    echo "whirlpool: $(echo -n "$password" | openssl dgst -whirlpool | awk '{print $2}')"
    echo "sha3-224: $(echo -n "$password" | openssl dgst -sha3-224 | awk '{print $2}')"
    echo "sha3-256: $(echo -n "$password" | openssl dgst -sha3-256 | awk '{print $2}')"
    echo "sha3-384: $(echo -n "$password" | openssl dgst -sha3-384 | awk '{print $2}')"
    echo "sha3-512: $(echo -n "$password" | openssl dgst -sha3-512 | awk '{print $2}')"
    echo "blake2b-512: $(echo -n "$password" | openssl dgst -blake2b512 | awk '{print $2}')"
    echo "blake2s-256: $(echo -n "$password" | openssl dgst -blake2s256 | awk '{print $2}')"
    echo "sm3: $(echo -n "$password" | openssl dgst -sm3 | awk '{print $2}')"
    echo "skein512-512: $(echo -n "$password" | openssl dgst -skein512 | awk '{print $2}')"
    echo "skein1024-1024: $(echo -n "$password" | openssl dgst -skein1024 | awk '{print $2}')"
    echo "gost: $(echo -n "$password" | openssl dgst -md_gost | awk '{print $2}')"
    echo "crc32: $(echo -n "$password" | openssl dgst -crc32 | awk '{print $2}')"
    echo "adler32: $(echo -n "$password" | openssl dgst -adler32 | awk '{print $2}')"
    echo "sum: $(echo -n "$password" | cksum | awk '{print $1}')"
}

while true; do
    echo
    echo "Main Menu:"
    echo "1. Hash password"
    echo "2. Exit"

    read -p "Enter your choice (1 or 2): " choice

    case $choice in
        "1")
            read -p "Enter the password to hash: " password
            hash_password "$password"
            ;;
        "2")
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
