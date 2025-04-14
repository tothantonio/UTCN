#!/bin/bash

for FNAME in `find . -name "*.c"`
do
	#echo $FNAME
	SIZE=`wc -l $FNAME | cut -d" " -f 1`
	#echo $SIZE
	if test $SIZE -gt 20; then
		echo $FNAME
	fi
done

