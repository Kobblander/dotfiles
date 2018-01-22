#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function errorbox() {
    echo -en "\t[${RED}x${NC}] "
}

function successbox() {
    echo -en "\t[${GREEN}✓${NC}] "
}

echo "Installing..."
errorbox; echo "Foobar"
successbox; echo "Polybar"
successbox; echo "Git"
errorbox; echo "Stackoverflow"
successbox; echo "i3"
