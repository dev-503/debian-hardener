#!/bin/bash

git clone https://github.com/ovh/debian-cis.git && cd debian-cis

# Copy the file debian/default to /etc/default/cis-hardening
cp debian/default /etc/default/cis-hardening

# Update the CIS_LIB_DIR value in /etc/default/cis-hardening
sed -i "s#CIS_LIB_DIR=.*#CIS_LIB_DIR='$(pwd)'/lib#" /etc/default/cis-hardening

# Update the CIS_CHECKS_DIR value in /etc/default/cis-hardening
sed -i "s#CIS_CHECKS_DIR=.*#CIS_CHECKS_DIR='$(pwd)'/bin/hardening#" /etc/default/cis-hardening

# Update the CIS_CONF_DIR value in /etc/default/cis-hardening
sed -i "s#CIS_CONF_DIR=.*#CIS_CONF_DIR='$(pwd)'/etc#" /etc/default/cis-hardening

# Update the CIS_TMP_DIR value in /etc/default/cis-hardening
sed -i "s#CIS_TMP_DIR=.*#CIS_TMP_DIR='$(pwd)'/tmp#" /etc/default/cis-hardening

# Runner Bash And Benchmark

./bin/hardening/1.1.1.1_disable_freevxfs.sh --audit
