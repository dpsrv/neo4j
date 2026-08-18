#!/bin/bash -e

SWD=$(dirname $0)
for yaml in $(ls -r $SWD/*.yaml); do
	kubectl delete -f $yaml --ignore-not-found
done
