# -*- coding: utf-8 -*-
"""
Created on Wed Jul 31 18:29:35 2013

@author: stuart
"""
import os
import glob

wheels = glob.glob("./wheelhouse/*whl")

outf = open("./wheelhouse/index.html",'w')

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
