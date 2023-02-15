#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

mkdir -p ~/.byond/bin
wget -O ~/.byond/bin/libauxmos.so "https://github.com/sunset-wasteland/auxmos/releases/download/v2.3.0-preview-01-07-2023/libauxmos.so"
chmod +x ~/.byond/bin/libauxmos.so
ldd ~/.byond/bin/libauxmos.so
