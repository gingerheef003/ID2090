#!/usr/bin/python3

import sys
from sage.all import pi,e,n

# Take two arguments from command-line call
s = sys.argv[1]
try:
    n = int(sys.argv[2])
except:
    try:
        n = int(float(sys.argv[2]))
    except:
        sys.exit("Enter positive integer as second argument")
    print("Taking integer part of number...")

# Special Characters to check for
sc = ['*','/','+','-']

# Check if expression is simple
if len([i for i in map(s.find, sc) if i != -1]) <= 1:
    # Check if n is positive integer
    if n > 0:
        try:
            nc = str(eval(s).n()).find('.')
            nd = int(str(eval(s).n(digits=(n+nc+1)))[-2])
            print(nd)
        except:
            print('Enter a valid expression as first argument')
    else:
        print('Enter positive integer as second argument')

else:
    print('Enter a simple expression as first argument')
