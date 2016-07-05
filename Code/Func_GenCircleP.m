function CirclePoints = Func_GenCircleP(itotalcount)

n = 3000;
radius = 1450;
RactangleA = zeros(n, n);

totalcount = itotalcount;
while(totalcount>0)
	for x = 1 : n
        for y = 1 : n
            if ( totalcount == 0 )
                break;
            end
            randomX = ceil(n*rand());
            randomY = ceil(n*rand());
            if(RactangleA(randomX, randomY) == 0)
                if (randomX - n/2).^2 + (randomY - n/2).^2 <= radius.^2                       
                    RactangleA(randomX, randomY) = 1;
                    totalcount = totalcount - 1;
                end
            end
        end
	end
end
CirclePoints = RactangleA;