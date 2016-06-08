#!/bin/bash
if [ $# -eq 1 ]
  then
	echo commit name is : $1
	git add .
	git commit -m $1
	git push origin master
fi



