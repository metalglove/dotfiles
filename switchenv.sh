#!/bin/bash

function exportvar()
{
	export $1=$2;
	echo "Set $1=$2";
}

# script to switch envs
case $1 in
	"neuralm" )
		exportvar "VUE_APP_MESSAGEQUEUE_HOST" "localhost"
		exportvar "VUE_APP_MESSAGEQUEUE_PORT" 5000
		exportvar "CERTIFICATE_PATH" ""
		exportvar "CERTIFICATE_PASSWORD" ""
		exportvar "USER_DB_SA_PASSWORD" ""
		exportvar "REGISTRY_DB_SA_PASSWORD" ""
		exportvar "TRAININGROOM_DB_SA_PASSWORD" ""
		;;
	* )
		echo "Unknown env!";
		echo "Available envs: neuralm";
		;;
esac
