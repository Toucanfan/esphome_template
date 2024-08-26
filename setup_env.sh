#!/bin/bash

if [ "$SHELL" != /bin/bash ]; then
	echo "This source file only supports the BASH shell."
	return 1
fi

(return 0 2>/dev/null) && sourced=1 || sourced=0
if [ "$sourced" != 1 ]; then
	echo "This file should not be executed, but sourced!"
	exit 1
fi

if [ ! -f /usr/share/modules/init/bash ]; then
	echo "This projects depends on the 'environment-modules' package."
	if [ -x /usr/bin/apt-get ] && [ -x /usr/bin/sudo ]; then
		echo "Please enter your password to proceed with its installation."
		sudo apt-get install environment-modules
	else
		echo "Please install it manually, then source this file again."
		return 1
	fi
fi

. /usr/share/modules/init/bash
module load ./scripts/setup/bootstrap.module
