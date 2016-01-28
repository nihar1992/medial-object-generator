function y = ismedian(points,faces,inpoints,n,tol)
l1=size(inpoints,1);
l2=size(faces,1);
medianpoints = [];
for i=1:1:l1
    [min,pr]=pointLineDistance(points(faces(1,1),:),points(faces(1,2),:),inpoints(i,:));
    flag=0;
    for j=2:1:l2
        [distance,pt]=pointLineDistance(points(faces(j,1),:),points(faces(j,2),:),inpoints(i,:));
        if distance >= (min-min*n) && distance <= (min+min*n)
            %c=pt==pr;
            if abs(pt(1)-pr(1)) >= tol || abs(pt(2)-pr(2)) >= tol
                flag = 1;
            end
        end
        if distance < (min-min*n)
            min=distance;
            pr=pt;
            flag=0;
        end       
    end
    if flag==1
        medianpoints = cat(1,medianpoints,inpoints(i,:));
    end
end
y=medianpoints;
end