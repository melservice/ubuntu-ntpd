#!/bin/bash
#
# Start des Services

pidfile="/run/ntpd.pid";

# per Trap wird der Dienst wieder heruntergefahren
trap 'if [ -f "$pidfile" ]; then kill -15 $(cat "$pidfile"); fi; exit 0' EXIT SIGINT SIGKILL SIGTERM

# Der NTP-Daemon wird gestartet
ntpd -p $pidfile 2>&1

echo sleep 10
sleep 10;

if [ -f "$pidfile" ]; then
	waitPID=$(cat "$pidfile");
	while ps aux | grep "$pidfile" 2>/dev/null >/dev/null; do
		echo sleep 1;
		sleep 1;
	done;
else
	echo "PID-File '$pidfile' ist nicht vorhanden";
fi;
