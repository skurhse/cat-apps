#!/usr/bin/env bash

nimble refresh
nimble build
bin/hmac "$@"