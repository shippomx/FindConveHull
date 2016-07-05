function Y = Func_FindConvexEdge( X )

[ H, W ] = size( X );

Break = 0;
for i = 1 : H
    for j = 1 : W
        if( 1 == X( i, j ) )
            TopX = j;
            TopY = i;
            Break = 1;
            break;%Important Flag
        end
    end
    if( 1 == Break )
        break;
    end
end

Break = 0;
for j = W : -1 : 1
    for i = 1 : H
        if( 1 == X( i, j ) )
            RightX = j;
            RightY = i;
            Break = 1;
            break;%Important Flag
        end
    end
    if( 1 == Break )
        break;
    end
end

Break = 0;
for i = H : -1 : 1
    for j = W : -1 : 1
        if( 1 == X( i, j ) )
            BottomX = j;
            BottomY = i;
            Break = 1;
            break;
        end
    end
    if( 1 == Break )
        break;
    end
end

Break = 0;
for j = 1 : W
    for i = H : -1 : 1
        if( 1 == X( i, j ) )
            LeftX = j;
            LeftY = i;
            Break = 1;
            break;
        end
    end
    if( 1 == Break )
        break;
    end
end

YCount = 0;
Y = zeros( 2 * ( H + W ), 2 ) - 1;

%% 1
PixelSet = zeros( 2 * ( RightY - TopY + 1 + RightX - TopX + 1 ), 2 );
Count = 0;
for i = TopY : RightY
    for j = TopX : RightX
        if( 1 == X( i, j ) )
            Count = Count + 1;
            PixelSet( Count, 1 ) = j; %x
            PixelSet( Count, 2 ) = i; %y
        end
    end
end
Len = Count;
Latest = 1;
for i = Latest : ( Len - 1 )
    if( Latest >= Len )
        break;
    end
    LatestX = PixelSet( Latest, 1 );
    LatestY = PixelSet( Latest, 2 );
    YCount = YCount + 1;
    Y( YCount, 1 ) = LatestX;
    Y( YCount, 2 ) = LatestY;
    MinSlope = 4;
    for j = Latest + 1 : Len
        Slope = atan2( PixelSet( j, 2 ) - LatestY, PixelSet( j, 1 ) - LatestX );
        if( Slope <= MinSlope )
            MinSlope = Slope;
            Latest = j;
        end
    end
end

%% 2
PixelSet = zeros( 2 * ( BottomY - RightY + 1 + RightX - BottomX + 1 ), 2 );
Count = 0;
for i = RightY : BottomY
    for j = RightX : -1 : BottomX
        if( 1 == X( i, j ) )
            Count = Count + 1;
            PixelSet( Count, 1 ) = j; %x
            PixelSet( Count, 2 ) = i; %y
        end
    end
end
Len = Count;
Latest = 1;
for i = Latest : ( Len - 1 )
    if( Latest >= Len )
        break;
    end
    LatestX = PixelSet( Latest, 1 );
    LatestY = PixelSet( Latest, 2 );
    YCount = YCount + 1;
    Y( YCount, 1 ) = LatestX;
    Y( YCount, 2 ) = LatestY;
    MaxSlope = -4;
    for j = Latest + 1 : Len
        Slope = atan2( PixelSet( j, 1 ) - LatestX, PixelSet( j, 2 ) - LatestY );
        if( Slope >= MaxSlope )
            MaxSlope = Slope;
            Latest = j;
        end
    end
end

%% 3
PixelSet = zeros( 2 * ( BottomY - LeftY + 1 + BottomX - LeftX + 1 ), 2 );
Count = 0;
for i = BottomY : -1 : LeftY
    for j = BottomX : -1 : LeftX
        if( 1 == X( i, j ) )
            Count = Count + 1;
            PixelSet( Count, 1 ) = j; %x
            PixelSet( Count, 2 ) = i; %y
        end
    end
end
Len = Count;
Latest = 1;
for i = Latest : ( Len - 1 )
    if( Latest >= Len )
        break;
    end
    LatestX = PixelSet( Latest, 1 );
    LatestY = PixelSet( Latest, 2 );
    YCount = YCount + 1;
    Y( YCount, 1 ) = LatestX;
    Y( YCount, 2 ) = LatestY;
    MinSlope = 4;
    for j = Latest + 1 : Len
        Slope = atan2( LatestY - PixelSet( j, 2 ), LatestX - PixelSet( j, 1 ) );
        if( Slope <= MinSlope )
            MinSlope = Slope;
            Latest = j;
        end
    end
end

%% 4
PixelSet = zeros( 2 * ( LeftY - TopY + 1 + TopX - LeftX + 1 ), 2 );
Count = 0;
for i = LeftY : -1 : TopY
    for j = LeftX : TopX
        if( 1 == X( i, j ) )
            Count = Count + 1;
            PixelSet( Count, 1 ) = j; %x
            PixelSet( Count, 2 ) = i; %y
        end
    end
end
Len = Count;
Latest = 1;
for i = Latest : ( Len - 1 )
    if( Latest >= Len )
        break;
    end
    LatestX = PixelSet( Latest, 1 );
    LatestY = PixelSet( Latest, 2 );
    YCount = YCount + 1;
    Y( YCount, 1 ) = LatestX;
    Y( YCount, 2 ) = LatestY;
    MaxSlope = -4;
    for j = Latest + 1 : Len
        Slope = atan2( PixelSet( j, 1 ) - LatestX, PixelSet( j, 2 ) - LatestY );
        if( Slope >= MaxSlope )
            MaxSlope = Slope;
            Latest = j;
        end
    end
end

YCount = YCount + 1;
Y( YCount, 1 ) = Y( 1, 1 );
Y( YCount, 2 ) = Y( 1, 2 );

Y = Y( 1 : YCount, : );
%%
