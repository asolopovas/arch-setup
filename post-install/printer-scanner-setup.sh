#!/bin/sh
pushd /tmp
  curl -L https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-M4580FX/uld_V1.00.39_01.17.tar.gz -o uld.tar.gz
  tar xvfz uld.tar.gz && rm -f uld.tar.gz
  sh /tmp/uld/install.sh
  sudo rm -rf /tmp/uld
popd

echo 'xerox_mfp' > /etc/sane.d/dll.conf
echo 'tcp 192.168.0.133' >> /etc/sane.d/xerox_mfp.conf
