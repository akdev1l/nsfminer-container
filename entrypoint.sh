#!/bin/bash

/opt/nsfminer -U -P "${MINING_POOL}" &

sleep "${MINING_TIMEOUT}"

kill %1

wait
