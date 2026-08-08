#!/bin/bash -e

SWD=$(dirname $0)
for yaml in $(ls -r $SWD/*.yaml); do
	cat $yaml | envsubst | kubectl delete -f - --ignore-not-found
done
