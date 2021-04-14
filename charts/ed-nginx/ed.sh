#!/bin/sh
pwd
helm lint $(dirname $0)
helm package $(dirname $0) -d $1
