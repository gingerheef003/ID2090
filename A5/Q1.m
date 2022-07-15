% Plots all points inside input.txt, and draws a circle around the neighborhood of a given point
% Also draws histogram of distance of all points from given point

% author: Govind G S, ME21B065

pts = csvread("input.txt");	% get 'input.txt' into array
[n,~] = size(pts);			% get value of n

w = str2num(argv(){1});		% get width of the box
i = str2num(argv(){2});		% get index of point to be taken in focus

r = w/10;	% radius of neighborhood to be taken

pnh = [];	% to store indices of points in neighborhood of pointin focus
dpts = [];	% to store distance of each points from point in focus

for c=1:n
	if(c == i)		% skip if counter same as point in focus
		continue;
	endif

	dpts(end + 1) = sqrt((pts(c,2)-pts(i,2))^2 + (pts(c,3)-pts(i,3))^2);	% calculate distance
	
	if(dpts(end) < r)	% check if counter is in neighborhood of point
		pnh(end + 1) = c;
	endif
end

figure(1);	% plot of points

hold on;

plot(pts(:,2),pts(:,3),'*','color','b'); % plot points

% axis with width as length
axis([0 w 0 w]);
axis equal;

% to draw circle around point
t = linspace(0,2*pi,1000);
plot(r*cos(t)+pts(i,2), r*sin(t)+pts(i,3));

hold off;

filename = sprintf("points-%d.jpg",i);
print('djpg',filename);	% output points image as 'points-<i>.jpg'

figure(2);	% histogram

hist(dpts, 10, "facecolor", "g");	% draw histogram with color green

print('-djpg', "histogram.jpg"); % output histogram image as 'histogram.jpg'
