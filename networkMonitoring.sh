#!/bin/bash

network_connectivity(){
	ping -c 4 google.com > /dev/null
	if [ $? -eq 0 ];then
		echo "Connection is: OK!"
	else
		echo "Connection is: FAILED!"
	fi
}

scan_ports(){
	read -p "Enter the target IP address or hostname: " target
	echo "Target: $target" > file
	nmap -p 1-1000 "$target" | grep ^[1-9] | awk '{print "Port", $1, "is open"}' >> file
}

analyze_traffic(){
	echo "Capturing network traffic. Press Ctrl+C to stop..."
	sudo tcpdump -i any -c 10 -nn -vvv -X
}

while true; do
	echo "=== Network Security Script ==="
	echo "1. Check network connectivity"
	echo "2. Scan for open ports"
	echo "3. Analyze network traffic"
	echo "4. Exit"
	read -p "Enter your choice: " choice

	case $choice in
	1) network_connectivity;;
	2) scan_ports;;
	3) analyze_traffic;;
	4) echo "Exiting..."; exit;;
	*) echo "Invalid input. Please, enter a number with 1 and 4"
	esac
	echo ""
done
