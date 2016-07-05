function [Points, NeedPos] = PCA_Find_MaxPoint(Points, startpos, endpos)

NeedPos = -1;

if endpos == -1 || startpos == -1 || startpos >= endpos
    return;
end


normal = [0, 1];
if Points(startpos, 2) - Points(endpos, 2) ~= 0
    tmpk = -(Points(startpos, 1) - Points(endpos, 1)) / (Points(startpos, 2) - Points(endpos, 2));
    moudle = sqrt(1 + tmpk * tmpk);
    normal = [1 / moudle, tmpk / moudle];
end

Distance = 0;
if normal(1, 2) <= 0
    Distance = -9999999;
elseif normal(1, 2) >= 0
    Distance = 9999999;
end

for pos = startpos + 1 : endpos - 1
    if ( ~isnan( Points(pos, 1) ) )
        EachP = [Points(startpos, 1) - Points(pos, 1), Points(startpos, 2) - Points(pos, 2)];
        tmpDistance = EachP(1, 1) * normal(1, 1) + EachP(1, 2) * normal(1, 2);
        if normal(1, 2) <= 0
            if tmpDistance > 0
                if (tmpDistance > Distance)
                    Distance = tmpDistance;
                    NeedPos = pos;
                end
            else
                Points(pos, :) = NaN;
            end
        elseif normal(1, 2) >= 0
            if tmpDistance < 0
                if (tmpDistance < Distance)
                    Distance = tmpDistance;
                    NeedPos = pos;
                end
            else
                Points(pos, :) = NaN;
            end
        end
    end
end