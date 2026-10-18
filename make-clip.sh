#!/bin/bash
# Usage: ./make-clip.sh <word>  -> audio/<word>-v2.mp3, male American voice (en-US-AndrewNeural, normal speed). Fails if empty.
set -e; cd "$(dirname "$0")"
python3 -m edge_tts --voice en-US-AndrewNeural --rate=+0% --text "$1" --write-media "audio/$1-v2.mp3"
[ -s "audio/$1-v2.mp3" ] || { rm -f "audio/$1-v2.mp3"; echo "clip failed" >&2; exit 1; }
