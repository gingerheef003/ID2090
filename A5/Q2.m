% Finds and outputs the closest three points of all points in 'input.txt' as 'edges.txt'
% Also outputs the plot of two example points and their closest three points

% author: Govind G S, ME21B065

pts = csvread("input.txt");	% get 'input.txt' into array
[n,~] = size(pts);			% get value of n

w = str2num(argv(){1});		% get width of the box

pnh = [];						% to store indices of closest three points
% looping through all the points
for i=1:n
	dmin = ones(1,3)*w*sqrt(2);	% to store distances of closest three points
	cmin = zeros(1,3);			% to store indices of closest three points

	for c=1:n
		if(c == i)		% skip if counter same as point in focus
			continue;
		endif

		d = sqrt((pts(c,2)-pts(i,2))^2 + (pts(c,3)-pts(i,3))^2);	%calculate distance
		
		if(d < dmin(1))		% algorithm to find the closest three points to point in focus
			dmin(3) = dmin(2);cmin(3) = cmin(2);
			dmin(2) = dmin(1);cmin(2) = cmin(1);
			dmin(1) = d;cmin(1) = c;
		elseif(d < dmin(2))
			dmin(3) = dmin(2);cmin(3) = cmin(2);
			dmin(2) = d;cmin(2) = c;
		elseif(d < min(3))
			dmin(3) = d;cmin(3) = c;
		endif
	end
	pnh(end+1,:) = [i cmin(1) cmin(2) cmin(3)];	% store point indices in array
end

csvwrite('edges.txt',pnh);	% write pnh points into 'edges.txt'

% random points to take neighborhood of
p1 = 35;
p2 = 79;

pnh12 = [pnh(p1,2:4) pnh(p2,2:4)];	% closest three points of random points
x = [];
y = [];
for g=1:6
	x(end+1) = pts(pnh12(1,g),2);
	y(end+1) = pts(pnh12(1,g),3);
end

plot(pts(:,2),pts(:,3),'.','color','k');	% plot all the points in black dots

axis([0 w 0 w]);
axis equal;			% axis with width as length

hold on;

plot(x,y,'*','color','m');	% plot closest three points of random points in magenta
plot([pts(p1,2) pts(p2,2)],[pts(p1,3) pts(p2,3)],'*','color','r');	% plot random points in red

for g=1:3
	line([pts(p1,2) x(g)],[pts(p1,3) y(g)],'color','g');	% plot lines to closest three points of first point in green
end
for g=4:6
	line([pts(p2,2) x(g)],[pts(p2,3) y(g)],'color','b');	% plot lines to closest three points of second point in blue
end

hold off;

print('-djpg',"example_points.jpg");	% output example image as 'example_points.jpg'
