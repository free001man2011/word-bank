#!/bin/bash
# Usage: ./make-clip.sh <word>  -> audio/<word>-us.mp3 in the male American voice (en-US-GuyNeural). Fails if the clip is empty.
set -e; cd "$(dirname "$0")"
python3 -m edge_tts --voice en-US-GuyNeural --rate=-15% --text "$1" --write-media "audio/$1-us.mp3"
[ -s "audio/$1-us.mp3" ] || { rm -f "audio/$1-us.mp3"; echo "clip failed" >&2; exit 1; }
