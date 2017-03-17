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

# find smallest binary
gzipSize="$(gzip -c9 "${BINARY}" | wc -c)"
bzip2Size="$(bzip2 -c9 "${BINARY}" | wc -c)"

if [ "${bzip2Size}" -lt "${gzipSize}" ]; then
    (
        cat drop-bzip2.sh
        bzip2 -c9 "${BINARY}"
    ) > "${DROPPER}"
else
    (
        cat drop-gzip.sh
        gzip -c9 "${BINARY}"
    ) > "${DROPPER}"
fi
chmod +x "${DROPPER}"
