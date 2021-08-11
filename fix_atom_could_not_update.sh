#!/bin/bash

# on MacOS Big Sur
# https://github.com/Squirrel/Squirrel.Mac/issues/182

mv Atom.app ~/Applications
xattr -dr com.apple.quarantine ~/Applications/Atom.app 
