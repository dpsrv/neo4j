#!/bin/bash -e

SWD=$(dirname $0)
for yaml in $SWD/*.yaml; do
	kubectl apply -f $yaml
done
