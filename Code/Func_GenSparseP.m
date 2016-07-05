function SparsePoints = Func_GenSparseP()

SparsePoints = zeros(6, 6);
PointsCount = 7;

for i = 1 : PointsCount
    m = ceil(30*rand());
    n = ceil(30*rand());
    SparsePoints(m, n) = 1;
end
