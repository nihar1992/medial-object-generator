function bool = cross_boundary(p0,p1,point_inside,point_outside)

v1 = p1-p0;
v2 = point_inside-point_outside;

if v1/norm(v1) == v2/norm(v2) | v1/norm(v1) == -v2/norm(v2)
    bool = true;
else
    par = inv( [v1(1) -v2(1); v1(2) -v2(2)] )*[point_outside(1) - p0(1); point_outside(2) - p0(2)];
    t = par(1);
    s = par(2);
    if 0 <= t & t <= 1 & 0 <= s & s <= 1
        bool = true;
    else
        bool = false;
    end
end
