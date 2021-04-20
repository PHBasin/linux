#!/bin/sh

echo "Do you want to destroy your entire file system?"
read response

case $response in
	"y" | "yes" )		echo "I hop you know what your are doing!";
									echo "I am supposed to type: rm -rf /";;
	"n" | "no" )		echo "You have comon sens! Aborting..";;
	* )		echo "You have to give an answer!";;
esac
exit 0
