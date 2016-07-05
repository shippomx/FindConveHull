function[Y_Jose, TotalCnt_Jose, RemainCnt_Jose] = Func_FindBasicEdge_Jose( X )
[ H, W ] = size( X );

%%
TotalCnt_Jose = 0;
for i = 1 : H
    for j = 1 : W
        if( ~isnan( X( i, j ) ) )
            TotalCnt_Jose = TotalCnt_Jose + 1;
        end
    end
end
%%

Y_Jose = zeros( H, W );

for j = 1 : W
    for i = 1 : H
        if( ~isnan( X( i, j ) ) )
            Y_Jose( i, j ) = 1;
            break;
        end
    end

    for i = H : -1 : 1
        if( ~isnan( X( i, j ) ) )
            Y_Jose( i, j ) = 1;
            break;
        end
    end
end

 RemainCnt_Jose = 0;
 for iH = 1:H
    for iW = 1:W
        if (Y_Jose(iH, iW)~= 0)
            RemainCnt_Jose = RemainCnt_Jose + 1;
        end
    end
end

