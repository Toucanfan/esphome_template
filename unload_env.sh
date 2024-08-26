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

module unload ./scripts/setup/bootstrap.module
