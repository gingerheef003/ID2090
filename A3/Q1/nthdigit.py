#!/usr/bin/python

import sys
from sage.all import pi,e,n

s = sys.argv[1]
n = int(sys.argv[2])

sc = ['*','/','+','-']

if len([i for i in map(s.find, sc) if i != -1]) <= 1:
    nc = str(eval(s).n()).find('.')
    nd = int(str(eval(s).n(digits=(n+nc+1)))[-2])

print(nd)
