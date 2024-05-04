#!/bin/bash

check_security_updates(){
	sudo apt update
	security_updates=$(apt list --upgradable 2>/dev/null | grep -c "\-security")
	if [ $security_updates -gt 0 ]; then
		echo "Security updates available: $security_updates"
		apply_security_updates
	else
		echo "No security updates available"
	fi
}

apply_security_updates(){
	sudo apt upgrade -y
	echo "Security updates applied successfully"
}

main(){
	echo "Security Patch Management Script"
	echo "Checking for available security updates..."
	check_security_updates
}

main
