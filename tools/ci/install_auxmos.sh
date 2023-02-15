#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

mkdir -p ~/.byond/bin
wget -O ~/.byond/bin/libauxmos.so target/i686-unknown-linux-gnu/release/libauxmos.so
chmod +x ~/.byond/bin/libauxmos.so
ldd ~/.byond/bin/libauxmos.so
