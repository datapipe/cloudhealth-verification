#!/bin/bash

s3cmd sync s3://cloudhealth-output/cloudhealth-output/ /mnt/cloudhealth/
s3cmd sync s3://cloudhealth-output// /mnt/cloudhealth/

cd /mnt/cloudhealth/
for i in `ls /mnt/cloudhealth/*.csv.zip`; do
  7z -y e $i
done
