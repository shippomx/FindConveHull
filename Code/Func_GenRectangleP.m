function RectanglePoints = Func_GenRectangleP(itotalcount)

n = 2000;
blank = 30;

RectanglePoints = zeros(n + blank, n + blank);
% for i = blank : n - blank
%     for j = blank : n - blank              
%         RectanglePoints(i, j) = 1;
%     end
% end 
totalcount = itotalcount;
while (totalcount > 0)
    for i = blank : n - blank
        for j = blank : n - blank
            if ( totalcount == 0 )
                break;
            end
            randomX = ceil((n - 2*blank)*rand()) + blank;
            randomY = ceil((n - 2*blank)*rand()) + blank;                    
            if(RectanglePoints(randomX, randomY) == 0)
                RectanglePoints(randomX, randomY) = 1;
             	totalcount = totalcount - 1;
            end
        end
    end
end
% RectanglePoints(blank + 1, blank + 1) = 1;
% RectanglePoints(blank + 1, n - blank) = 1;
% RectanglePoints(n - blank, blank + 1) = 1;
% RectanglePoints(n - blank, n - blank) = 1;



