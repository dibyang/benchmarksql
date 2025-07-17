#!/usr/bin/env bash

if [ $# -lt 1 ] ; then
    echo "usage: $(basename $0) PROPS_FILE [ARGS]" >&2
    exit 2
fi

source funcs.sh $1
shift

setCP || exit 1

myOPTS="-Dprop=${PROPS}"
myOPTS="${myOPTS} -Djava.security.egd=file:/dev/./urandom"
myOPTS="${myOPTS} -Dlog4j.configurationFile=./log4j2.xml"

java -cp "$myCP" $myOPTS com.github.pgsqlio.benchmarksql.loader.LoadData $*
