function Points = PCA_Find_Convexhull(Points, startpos, endpos)

maxpos = -1;
% Points is sorted in advance.
if endpos - startpos <= 1
    return;
end

[Points, maxpos] = PCA_Find_MaxPoint(Points, startpos, endpos);

if maxpos == -1
    return
end

Points = PCA_Find_Convexhull(Points, startpos, maxpos);
Points = PCA_Find_Convexhull(Points, maxpos, endpos);

