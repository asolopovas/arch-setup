#!/bin/sh
# Drivers Installation
pushd /tmp
  curl -L https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-M4580FX/uld_V1.00.39_01.17.tar.gz -o uld.tar.gz
  tar xvfz uld.tar.gz && rm -f uld.tar.gz
  sh /tmp/uld/install.sh
  sudo rm -rf /tmp/uld
popd
# Scanner Installation
echo 'xerox_mfp' > /etc/sane.d/dll.conf
echo 'tcp 192.168.0.100' >> /etc/sane.d/xerox_mfp.conf
# Add printer to the system
lpadmin -p SamsungM2070W -E -v "socket://192.168.0.100" -D "Samsung Xpress M2070W" -m uld-samsung/Samsung_M2070_Series.ppd -u allow:all -o PageSize=A4
