voice2text
==========


Licence
-------
Copyright Sebkst, 2013
this program is released under GPL v3
read http://www.gnu.org/licenses/gpl.txt

This file is part of voice2text.

voice2text is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License.

voice2text is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with voice2text.  If not, see <http://www.gnu.org/licenses/gpl.txt>.


Description
-----------

* Voice2text converts voice recordered from microphone to text using Google Voice API.
* RepeatAfterMe does what it is named after !


Dependencies
------------

Script requires:
 
* sox - for recording voice from command-line and save to wav file
* flac - for convertign recordered wav file to flac format
* curl - for sending HTTP requests with flac file to Google
* grep, echo, bash - basic shell tools for parsing text answered
* festival - for repeating and making the computer speak (in english by default)

To install all deps on Ubuntu run:

    $ sudo apt-get install sox flac curl festival


Running
-------

    ./english-voice2text

Press Ctrl+C to exit

    ./repeat-after-me

Press Ctrl+C to exit


Inspired by
-----------

* yura's initial release
* http://ab-log.ru/smart-house/speech/speech-recognition


ChangeLog/Todos
---------------

* show visual guidelines to know when to speak / wait for answer
* make it multi threaded : speak again while decoding is done
* make a repeat-after-me program
* activate bindings: "quit" or "exit"
* make an italian, a french wrapper
