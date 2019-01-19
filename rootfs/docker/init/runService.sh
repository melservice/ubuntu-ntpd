#!/bin/bash
#
# Start des Services

pidfile="/run/ntpd.pid";

# ----------------------------------------------------------------------------------------------

function stopService {
	if [ -f "$pidfile" ]; then
		kill -15 $(cat "$pidfile");
	fi;
	
	return 0;
}

# ----------------------------------------------------------------------------------------------

# per Trap wird der Dienst wieder heruntergefahren
trap 'stopService; exit $?' EXIT SIGINT SIGKILL SIGTERM

# Der NTP-Daemon wird gestartet
ntpd -p $pidfile 2>&1

echo sleep 10
sleep 10;

if [ -f "$pidfile" ]; then
	waitPID=$(cat "$pidfile");
	while ps aux | grep "$pidfile" 2>/dev/null >/dev/null; do
		sleep 10;
	done;
else
	echo "PID-File '$pidfile' ist nicht vorhanden";
fi;
