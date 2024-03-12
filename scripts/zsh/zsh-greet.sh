#!/usr/bin/env bash

HOST=$1

GRA="$(tput setaf 243)"
MAG="$(tput setaf 5)"
CYN="$(tput setaf 6)"
D=$(tput sgr0)

PAD="ꔘ ꔘ ꔘ "
PAD_LENGTH=${#PAD}
PADCHAR="ꔘ"

YO="Yo ${CYN}$USER!${D} Welcome to ${MAG}$HOST${D} "
YO_LENGTH=${#YO}

BOOKEND=$(for (( i = 0; i < ($YO_LENGTH - $PAD_LENGTH - 1) ; i++ )); do
	if (( $i % 2 == 0 )); then
		echo -n "$PADCHAR"
	else
		echo -n "${GRA}$PADCHAR${D}"
	fi
done)

echo "$BOOKEND"
echo "$PAD$YO$PAD"
echo "$BOOKEND"

