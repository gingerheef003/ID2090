# Question 2

### NAME
**mazerunner.py** - create labyrinth from file, print it and find solution for it.

### SYNOPSIS
```
./mazerunner.py maze.txt
```

### DESCRIPTION
**mazerunner.py** takes file name as argument. The file contains arrays required for maze creation. It creates file, "maze.png" containing pictorial representation of the labyrinth. It finds a solution to the maze if present and creates file, "maze_solution.png", containing pictorial represention of the solution to labyrinth.

### BUGS
**mazerunner.py** cannot find the solution to maze if it involves going down the maze. The algorithm only checks for up, left and right
