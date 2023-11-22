#!/bin/bash

if [ -z "$1" ]; then
	echo -e "";
	echo -e "Please specify one argument like : <restart> <serviceToRestart>";
	echo -e "Get help by typing restart [-h | --help]";
	echo -e "";
	exit 1;
fi

if [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
	echo -e "";
	echo -e "command to restart a systemd service and print it's status to CLI";
	echo -e "Use the command like so : <restart> <serviceToRestart>";
	echo -e "Enter restart -v or --version to get more info";
	echo -e "";
	exit 0;
fi

if [ "$1" = '-v' ] || [ "$1" = '--version' ]; then
	echo -e "";
	echo -e "Command used to restart service";
	echo -e "V1.0 written by Elam Monnot elammonnot@gmail.com";
	echo -e "";
	exit 0;
fi

systemctl restart "$1" && systemctl status "$1";
