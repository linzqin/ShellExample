#!/usr/bin/env bash
BIRTHDATE="Jan 1 2000"
Presents=10
BIRTHDAY="Saturday"

set -x
if [ "$BIRTHDATE" == "Jan 1 2000" ] ; then
	echo "BIRTHDATE is correct, it is $BIRTHDATE"
else
	echo "BIRTHDATE is incorrect - please retry"
fi
set +x
if [ $Presents == 10 ] ; then
	echo "correct! I have received $Presents presents"
else
	echo "Presents is incorrect - please retry"
fi
if [ "$BIRTHDAY" == "Saturday" ] ; then
	echo "correct! I was born on a $BIRTHDAY"
else
	echo "BIRTHDAY is incorrect - please retry"
fi
