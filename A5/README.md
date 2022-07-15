# Question 1 and Question 2

### SYOPSIS
```
python3 input_generator.py n w
octave Q1.m w i
octave Q2.m w
```

### DESCRIPTION
**input_generator.py** takes in two arguments. The first is the number of particles, *n*,  whose random position is to be found and the second argument is the width, *w*,  of the box inside which the particles are found. The program outputs a file **input.txt**


**Q1.m** takes in two arguments. The first is the width, *w*, of the box inside which the particles are found and the second argument is the index, *i*,  of the point to be taken as focus, values ranging from 1-n (both inclusive). The program outputs an image containg all the plotted points and a circle depicting the neighborhood of the point in focus in **points-i.jpg**. It also outputs an image of histogram of distance of all points from the point in focus as **histogram.jpg**


**Q2.m** takes in one argument, the width, *w*, of the box inside with particles are to be taken. The program finds and outputs the closest three points of all the points in **edges.txt**. It also outputs an image showing two example points and their closes three points in **example_points.jpg**

### EXAMPLE
```
python3 input_generator.py 100 500
octave Q1.m 500 25
octave Q2.m 500
```
