#!/bin/bash

HOST=ftp.servage.net  #This is the FTP servers host or IP address.

#Move into the dir where we will upload all wheels
cd wheelhouse

ftp -inv $HOST << EOF

user $USER $PASS

put *whl
EOF
