#!/bin/bash

# copyright 2013 Sebkst
# GPL v3
# thanks to google speech api and to festival

LANG='en-US'

LOG=$1

GOOGLE_API_URL="https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=$LANG"


echo "- Speak in English, please"

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
   echo " :-(" ;
   echo 'Sorry?' | festival --tts
  else
   echo -n "."
   echo "${COMMANDS}" | festival --tts
   if [ -z "$LOG" ]; then
     echo "."
   else
     echo "${COMMANDS}" >> $LOG || LOG=""
     echo "."
    fi
   echo "${COMMANDS}"
   if [ "$COMMANDS" == "exit" ]; then
     break
   fi
  fi
done
