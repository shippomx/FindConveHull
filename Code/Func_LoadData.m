function X = Func_LoadData( FileName )
fpX = fopen( FileName, 'rb' );
if( fpX < 0 )
    return;
end
Rows = fread( fpX, 1, 'int32' );
Cols = fread( fpX, 1, 'int32' );
Length = Rows * Cols;
X = fread( fpX, Length, 'float32' );
fclose( fpX );
X = reshape( X, Cols, Rows )';

for iRow = 1:Rows
    for iCol = 1:Cols
        if(  X( iRow, iCol ) ~= 0 )
            X( iRow, iCol) = 1;%设置点云基本色
        end
    end
end
