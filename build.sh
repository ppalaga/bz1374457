#!/bin/bash

set -e
set -x

if [ "x$JBOSS_HOME" == "x" ]; then
  echo "Set JBOSS_HOME"
  exit 1
fi

rm -Rf $JBOSS_HOME/standalone/deployments/*

rm -Rf $JBOSS_HOME/standalone/log/*

i=1
mvn clean install -Dapp-index=${i}
cp -t $JBOSS_HOME/standalone/deployments target/bz1374457-${i}.war

i=2
mvn clean install -Dapp-index=${i}
cp -t $JBOSS_HOME/standalone/deployments target/bz1374457-${i}.war

cp -t $JBOSS_HOME/standalone/configuration standalone.xml

$JBOSS_HOME/bin/standalone.sh
