function TrianglePoints = Func_GenTriangleP()

bottom = 500;
height = round(bottom/3*2);

Triangle = zeros(height, bottom);
for ih = 20 : height
    for ib = 1 : bottom/2 - ih + 1
        Triangle(ih, ib + ih - 1) = 1;
        Triangle(ih, bottom - ib - ih + 1) = 1;
    end
end

TrianglePoints = Triangle;