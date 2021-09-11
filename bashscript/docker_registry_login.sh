#!/bin/bash

cat ~/registry_pass.txt | docker login --username alice --password-stdin https://registry.anywhere.example.com/
