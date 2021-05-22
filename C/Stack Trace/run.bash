#!/usr/bin/env bash

[ ! -d bin ] && mkdir bin
gcc -Wall stack_trace.c -o bin/stack_trace
bin/stack_trace
