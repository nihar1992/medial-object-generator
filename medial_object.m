function None = medial_object(filename)

vertices = read_wrl(filename);

step = 300;

n = length(vertices);
indices = [];

medial_points = [];

for i = 1:n
    if i == n
        indices = cat(1,indices,[n 1]);
    else
        indices = cat(1,indices,[i,i+1]);
    end
end

adjusted_vertices = ones(n,3);

x_min = min( vertices(:,1) );
x_max = max( vertices(:,1) );
y_min = min( vertices(:,2) );
y_max = max( vertices(:,2) );

if x_max-x_min == 0
    adjusted_vertices(:,1) = vertices(:,2);
    adjusted_vertices(:,2) = vertices(:,3);
    adjusted_vertices(:,3) = vertices(:,1);
elseif y_max-y_min == 0
    adjusted_vertices(:,1) = vertices(:,3);
    adjusted_vertices(:,2) = vertices(:,1);
    adjusted_vertices(:,3) = vertices(:,2);
else
    adjusted_vertices = vertices;
end

x_min = min( adjusted_vertices(:,1) );
x_max = max( adjusted_vertices(:,1) );
y_min = min( adjusted_vertices(:,2) );
y_max = max( adjusted_vertices(:,2) );
z_min = min( adjusted_vertices(:,3) );
z_max = max( adjusted_vertices(:,3) );

tol = min(x_max-x_min,y_max-y_min)/30;

maximum = max([x_max,y_max,z_max]);

point_outside = [x_min,y_min,z_min] - [pi exp(1) 2];

k = 0;

for i = x_min:(x_max - x_min)/step:x_max
    for j = y_min:(y_max - y_min)/step:y_max
        point_inside = [i j k];
        num_intersect = 0;
        for h = 1:n
            if h == n
                p0 = adjusted_vertices(n,:);
                p1 = adjusted_vertices(1,:);
            else
                p0 = adjusted_vertices(h,:);
                p1 = adjusted_vertices(h+1,:);
            end
            num_intersect = num_intersect + cross_boundary(p0,p1,point_inside,point_outside);
        end
        if mod(num_intersect,2) == 1
            medial_point = ismedian(adjusted_vertices,indices,point_inside,0.01,tol);
            if isempty(medial_point) == 0
                medial_points = cat(1, medial_points, medial_point);
            end
        end
    end
end

figure(1)
hold all;
plot(adjusted_vertices(:,1),adjusted_vertices(:,2),'b-','LineWidth',5)
plot([adjusted_vertices(n,1),adjusted_vertices(1,1)],[adjusted_vertices(n,2),adjusted_vertices(1,2)],'b-','LineWidth',5)
plot(medial_points(:,1),medial_points(:,2),'rs')
axis([x_min x_max y_min y_max])