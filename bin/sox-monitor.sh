#!/bin/sh 
# vim: set ts=2 sw=2 sts=2 et si ai: 

# sox-monitor.sh 
# =
# 
# Andres Aquino <aquino@hp.com>
# Hewlett-Packard Company | EBS
# 

. ~/sox-monitor.rc

#
cd ${APHOME}

# Por cada servidor
for SERVER in conf/*cnf
do
  . ${SERVER}
  echo "Connecting to ${IPADDRESS} with ${USERNAME} defined by ${SERVER%.cnf}"
  DATA="${SERVER%.cnf}.inf"
  for INFFILE in $(cat ${DATA})
  do
    echo "ls -l ${INFFILE}" 
    echo "openssl dgst -md5 ${INFFILE}"
    dirname ${INFFILE}
    basename ${INFFILE}
  done
 
done

# 
