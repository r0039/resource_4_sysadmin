#!/bin/bash
# Author:	Tien
# Purpose:	Atom crashes after upgrading new version
# on MacOS Big Sur
# https://github.com/Squirrel/Squirrel.Mac/issues/182

mv Atom.app ~/Applications
xattr -dr com.apple.quarantine ~/Applications/Atom.app 
