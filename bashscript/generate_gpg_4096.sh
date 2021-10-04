#!/bin/bash 
# source https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key 

# create GPG RSA 4096
gpg --default-new-key-algo rsa4096 --gen-key

# list GPG keys 
gpg --list-secret-keys --keyid-format=long

# export GPG key
gpg --armor --export 3A75F63E1FCF379A0A0E762FF1BD4862F2A

# export GPG key to file 
gpg --armor --output tien.phan.gpg --export 3A75F63E1FCF379A0A0E762FF1BD4862F2A
