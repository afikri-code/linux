#!/bin/bash

# Author: Ahmed Fikri 
# 2020     

#start db instance
if [ -z ${ORACLE_SID+x} ] ; then echo "ORACLE_SID not set";
  exit 1;
fi;

if [ -z ${ORACLE_HOME+x} ] ; then echo "ORACLE_HOME is not set";
  exit 1;
fi;
PATH=$PATH:$ORACLE_HOME/bin


echo "start";

echo "ORACLE_SID => $ORACLE_SID";
echo "ORACLE_HOME => $ORACLE_HOME";
#
sqlplus -s <<EOF
/ as sysdba
startup;
alter pluggable database all open;
EOF
lsnrctl start
exit 0
