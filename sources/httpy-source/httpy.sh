#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ]; then
	python3 -m http.server;
	exit 0;
fi

if [ "$1" = "--help" ] || [ "$1" = '-h' ]; then
	echo -e "";
	echo -e "Alias of the command : python3 -m http.server, it exposes current directory on port 8000 by default.";
	echo -e "Used primarly as an easy way to share files.";
	echo -e "--help, -h : show the help for this command";
	echo -e "--version, -v : show the command's version and author";
	echo -e "-p : specify the port to bind the web server";
	echo -e "Syntax : <httpy> [-p portNumber]";
	echo -e "";
	exit 0;
fi

if [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
	echo -e "";
	echo -e "httpy version 1.0, made by Elam Monnot : elammonnot@gmail.com";
	echo -e "";
	exit 0;
fi

if [ "$1" == "-p" ]; then
	if [ "$2" -lt 1025 ]; then
		echo -e "Please use a port higher than 1024";
		exit 1;
	fi

	if [ "$2" -gt 65536 ]; then
		echo -e "Please use a port lower than 65536";
		exit 1;
	fi

	python3 -m http.server "$2";
	exit 0;
fi

echo -e "";
echo -e "Error, could not start the http server. Syntax : <httpy> [-p portNumber]";
echo -e "";
exit 1;
