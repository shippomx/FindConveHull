function [Y, TotalCnt_Proposed, RemainCnt_Proposed] = Func_FindBasicEdge_Proposed( X )

%%
TotalCnt_Proposed = 0;
[ H, W ] = size( X );
%%

Y1 = zeros( H, W );
for i = 1 : H
    for j = 1 : W
        if( ~isnan( X( i, j ) ) )
            Y1( i, j ) = 1;
            TotalCnt_Proposed = TotalCnt_Proposed + 1;
            break;
        end
    end
    
    for j = W : -1 : 1
        if( ~isnan( X( i, j ) ) )
            Y1( i, j ) = 1;
            break;
        end
    end
end

Y2 = zeros( H, W );
for j = 1 : W
    for i = 1 : H
        if( ~isnan( X( i, j ) ) )
            Y2( i, j ) = 1;
            break;
        end
    end

    for i = H : -1 : 1
        if( ~isnan( X( i, j ) ) )
            Y2( i, j ) = 1;
            break;
        end
    end
end

Y = Y1 .* Y2;

 RemainCnt_Proposed = 0;
 for iRow = 1:H
    for iCol = 1:W
        if (Y(iRow, iCol)~= 0)
            RemainCnt_Proposed = RemainCnt_Proposed + 1;
        end
    end
end