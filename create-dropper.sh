#!/bin/sh

BINARY="${1}"
DROPPER="${2}"

if [ -z "${BINARY}" ]; then
    echo "$0 <binary> [<dropper.sh>]"
    exit 1
fi

if [ -z "${DROPPER}" ]; then
    DROPPER="$(basename "${BINARY}").sh"
fi

(
    cat drop-bzip2.sh
    bzip2 -c -9 < "${BINARY}"
) > "${DROPPER}"
chmod +x "${DROPPER}"
