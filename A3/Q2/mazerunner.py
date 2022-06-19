#!/usr/bin/python

import sys
import matplotlib.pyplot as plt

H,V = [],[]
h,v = [],[]
row = 0

fname = sys.argv[1]

# Read the arrays H and V from a file
with open(fname, 'r') as f:
    l = f.read()

for k in range(len(l)):
    if not row:
        if l[k] == ',':
            h.append(int(l[k-1]))
        elif l[k] == ';':
            h.append(int(l[k-1]))
            H.append(h)
            h = []
        elif l[k] == '\n':
            row = 1
    else:
        if l[k] == ',':
            v.append(int(l[k-1]))
        elif l[k] == ';':
            v.append(int(l[k-1]))
            V.append(v)
            v = []


# Generate labyrinth figure from the given arrays
d = 0.06
lw = '5'

fig = plt.figure()

for j,n in enumerate(H):
    for i,m in enumerate(n):
        if m == 1:
            plt.plot([i+d, i+1-d], [j, j], c='b', lw=lw)

for j,n in enumerate(V):
    for i,m in enumerate(n):
        if m == 1:
            plt.plot([i, i], [j+d, j+1-d], c='r', lw=lw)

fig.savefig('maze.png')


# Determine continous path from bottom to top
p = []
for i in range(len(H[0])):
    if H[0][i] == 0:
        p.append((i+1,1))
        break

frmL = 0
frmR = 0

pathfound = True

def pathfinder(x,y):
    global frmL,frmR
    if y < len(H):
        if H[y][x-1] == 0:
            p.append((x,y+1))
            frmR = 0
            frmL = 0
            pathfinder(x,y+1)
        else:
            if frmR == 0 and V[y-1][x] == 0:
                p.append((x+1,y))
                frmL = 1
                frmR = 0
                pathfinder(x+1,y)
            elif frmL == 0 and V[y-1][x-1] == 0:
                p.append((x-1,y))
                frmR = 1
                frmL = 0
                pathfinder(x-1,y)
            else:
                print("Path not Found!!")
                pathfound = False

pathfinder(p[0][0],p[0][1])


# Plot the solution of the labyrinth if any
if pathfound:
    p = p[:-1]
    print("S =", p)

    hf = 0.5
    lwp = '10'
    
    plt.plot([p[0][0]-hf,p[0][0]-hf],[0-hf,0+hf], c='y', lw=lwp)

    for x,y in enumerate(p[:-1]):
        if p[x+1][0] == y[0]:
            plt.plot([y[0]-hf,y[0]-hf],[y[1]-hf,y[1]+hf], c='y', lw=lwp)
        else:
            plt.plot([y[0]-hf,p[x+1][0]-hf],[y[1]-hf,y[1]-hf], c='y', lw=lwp)

    plt.plot([p[-1][0]-hf,p[-1][0]-hf],[p[-1][1]-hf,p[-1][1]+hf], c='y', lw=lwp)

fig.savefig('maze_solved.png')
