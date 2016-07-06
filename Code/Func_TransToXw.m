function [Xw, TotalCnt] = Func_TransToXw(X)

TotalCnt = 0;
[ H, W ] = size( X );
for i = 1 : H
    for j = 1 : W
        if( X(i, j) ~= 0 )
            TotalCnt = TotalCnt + 1;
        end
    end
end

Xw = zeros(TotalCnt, 2);
Cnt = 0;
for i = 1 : H
    for j = 1 : W
        if( X(i, j) ~= 0 )
            Cnt = Cnt + 1;
            Xw(Cnt, :) = [i, j];
        end
    end
end