#!/bin/bash

LANG=$1

if [ -z $LANG ]; then
  LANG='en-US'
fi

LOG=$2

GOOGLE_API_URL="https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=$LANG"


echo "- Language: $LANG"

while [ true ]; do
  echo ">> Recording..."
  rec -q -c 1 -r 16k commands.wav silence 1 0.3 4% 1 0.3 4%
  echo -n "<< Recognition."
  flac -f -s commands.wav -o commands.flac
  echo -n "."
  COMMANDS=""
  COMMANDS=$( curl -s -H "Content-Type: audio/x-flac; rate=16000" --data-binary @commands.flac $GOOGLE_API_URL | grep -Po '(?<="utterance":")[^"]+(?=",)' )
  echo -n "."
  if [ -z "$COMMANDS" ]; then
   echo " :-("
  else
   echo "."
   if [ -z $LOG]; then
     echo "${COMMANDS}"
   else
     echo ${COMMANDS}
     echo "${COMMANDS}" >> $LOG
    fi
  fi
done
