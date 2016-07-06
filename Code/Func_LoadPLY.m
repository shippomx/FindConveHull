function X = Func_LoadPLY( FileName )
%% ReadXYZ
fidin = fopen( FileName, 'rb' );

GridPrecision = 0.0005;

if( fidin < 0 )
    return;
end

PlyLength = 0;
bfind = false;
interator = 0;
while ~feof(fidin)
	PLYline=fgetl(fidin);
	if ~isempty(PLYline)
        [tword1, tword2, tword3] = strread(PLYline,'%s %s %s');
        if ~isempty(tword1)
            word1 = tword1(1, 1);
        else
            word1 = tword1;
        end
        if ~isempty(tword2)
            word2 = tword2(1, 1);
        else
            word2 = tword2;
        end
        if ~isempty(tword3)
            word3 = tword3(1, 1);
        else
            word3 = tword3;
        end
        if(strcmp(word1, 'element'))
            tmpLength = str2double(word3);
            PlyLength = int64(tmpLength);
            PointsCloud = zeros(3, PlyLength);
        end
        if bfind
            interator = interator + 1;
            tmpX = str2double(word1);
            tmpY = str2double(word2);
            tmpZ = str2double(word3);
            PointsCloud(1, interator) = tmpX;
            PointsCloud(2, interator) = tmpY;
            PointsCloud(3, interator) = tmpZ;
            if(interator == PlyLength)
                break;
            end
        end
        if(strcmp(word1, 'end_header'))
            bfind = true;
        end
	end
end
fclose(fidin);

%% Projection
MaxX = max(PointsCloud(1, :)); MinX = min(PointsCloud(1, :));
MaxY = max(PointsCloud(2, :)); MinY = min(PointsCloud(2, :));
%MaxZ = max(PointsCloud(3, :)); MinZ = min(PointsCloud(3, :));
Pure_array = zeros(PlyLength, 2);
tPure_array = PointsCloud';
Pure_array(:, 1) = tPure_array(:, 1);
Pure_array(:, 2) = tPure_array(:, 2);

DistX = MaxX - MinX;
DistY = MaxY - MinY;
%DistZ = MaxZ - MinZ;
GridX = round(DistX / GridPrecision);
GridY = round(DistY / GridPrecision);
%GridZ = round(DistZ / GridPrecision);
% ProjectionX = zeros(GridY, GridZ);
% ProjectionY = zeros(GridX, GridZ);
ProjectionZ = zeros(GridX, GridY);


for pos = 1 : PlyLength
    tmpX = round(( PointsCloud(1, pos) - MinX) / GridPrecision + 0.5);
    tmpY = round(( PointsCloud(2, pos) - MinY) / GridPrecision + 0.5);
    %tmpZ = round(( PointsCloud(3, pos) - MinZ) / GridPrecision + 0.5);
    ProjectionZ(tmpX, tmpY) = 1;
end


X = ProjectionZ';
%X = Pure_array;
