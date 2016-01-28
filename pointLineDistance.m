function [y,pr] = pointLineDistance(p1,p2,p3)
l1=p2-p1;
l2=p3-p1;
l3=p3-p2;
modl=((l1(1)^2+l1(2)^2+l1(3)^2)^(1/2));
p4=p1+((l1(1)*l2(1)+l1(2)*l2(2)+l1(3)*l2(3))/(modl*modl))*l1;
if p1(1) <= p2(1) 
    xl=p1(1);
    xm=p2(1);
else
    xl=p2(1);
    xm=p1(1);
end
if p1(2) <= p2(2) 
    yl=p1(2);
    ym=p2(2);
else
    yl=p2(2);
    ym=p1(2);
end
if p1(3) <= p2(3) 
    zl=p1(3);
    zm=p2(3);
else
    zl=p2(3);
    zm=p1(3);
end
if p4(1) >= xl && p4(1) <=xm && p4(2) >= yl && p4(2) <=ym && p4(3) >= zl && p4(3) <=zm
    n=l1/modl;
    projection=n(1)*l2(1)+n(2)*l2(2)+n(3)*l2(3);
    length=(l2(1)*l2(1)+l2(2)*l2(2)+l2(3)*l2(3))^(1/2);
    y=(length^2-projection^2)^(1/2);
    pr=p4;
else
    d2=(l2(1)*l2(1)+l2(2)*l2(2)+l2(3)*l2(3))^(1/2);
    d3=(l3(1)*l3(1)+l3(2)*l3(2)+l3(3)*l3(3))^(1/2);
    if d2<=d3
        y=d2;
        pr=p1;
    else
        y=d3;
        pr=p2;
    end
end
end