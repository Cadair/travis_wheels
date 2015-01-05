# -*- coding: utf-8 -*-
"""
Created on Wed Jul 31 18:29:35 2013

@author: stuart
"""
from __future__ import print_function
import os
from ftplib import FTP

ftp = FTP('ftp.servage.net')
ftp.login(user=os.environ['FTP_USER'], passwd=os.environ['FTP_PASS'])
files = ftp.nlst()

wheels = []
for file in files:
    if os.path.splitext(file)[1] == '.whl':
        wheels.append(file)
for file in glob.glob("wheelhouse/*whl"):
    if os.path.splitext(file)[1] == '.whl':
        wheels.append(file)

wheels.sort()
wheels = list(set(wheels))
print(wheels)

outf = open("wheelhouse/index.html",'w')

header = [
'<html>\n',
'<head>\n',
'<title>SunPy Wheelhouse</title>\n',
'</head>\n',
'<body>\n'
]
outf.writelines(header)


for wheel in wheels:
    outf.write("<a href=%s>%s</a></br>\n"%(os.path.basename(wheel),os.path.basename(wheel)))

outf.write("</body>\n")
outf.write("</html>\n")
