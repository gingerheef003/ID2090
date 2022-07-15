#!/usr/bin/python3

# imports for getting random integer and command-line arguments
import random
import sys

n = int(sys.argv[1])	# number of particles, N
w = int(sys.argv[2])	# width of the box

# create input.txt file with random values for x and y
with open('input.txt','w') as f:
	for c in range(n):
		f.write(str(c+1) + "," + str(random.randint(1,w)) + "," + str(random.randint(1,w)) + "\n")
