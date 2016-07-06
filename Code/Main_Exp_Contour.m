close all; clear; clc;

% totalcount = 6400;% totalcount < 4000000 ，[ 409600, 819200, 1638400, 3276800];
% X = Func_GenCircleP(totalcount); % Func_GenTriangleP(); Func_GenRectangleP(totalcount); Func_GenSparseP();
%X = Func_LoadData( './../Data/star.dat' );%ReadFile
%X = Func_LoadPLY( './../Data/Reindeer.ply' );% Astar_New, Bull, Bison, Camel，Elephant_African，Elephant_Asian， Pig， Polar， Reindeer.--------------- % --Attention: Astar_New can not be loaded with small GridPrecision!
%------------------------------------------
RoughData = load('./../Data/Bison.mat');% Bull，Camel，Elephant_African，Elephant_Asian， Pig， Polar， Reindeer
X = RoughData.X;
%------------------------------------------
Th = 0.8;
Idx = find( X < Th );
X( Idx ) = 0;
%%
[Xw, PointsCount] = Func_TransToXw(X);
tic;
PCA_Cvx = Func_PCA_FindConvexHull(Xw);
toc;
%%
% figure; imagesc( X ); axis image; %colorbar;
% tic;
% Edge_origin = Func_FindConvexEdge( X );
% toc;

%%
% figure; imagesc( ~X ); axis image; colormap gray;
% hold on;
% set( gca, 'XTickMode', 'auto', 'FontSize', 13, 'FontWeight', 'b');
% 
% tic;
% [Edge_Jose, TotalCnt_Jose, RemainCnt_Jose] = Func_FindBasicEdge_Jose( X );
% Edge_Polygen_Jose = Func_FindConvexEdge( Edge_Jose );
% plot( Edge_Polygen_Jose( :, 1 ), Edge_Polygen_Jose( :, 2 ), 'Color', 'k', 'LineWidth',1 );%需根据情况调整线宽
% toc;
% title({'Jose'});
% hold off;
% Jose_S = (RemainCnt_Jose / TotalCnt_Jose) * 100.00;

%%
% Proposed algorithm.
figure; imagesc( ~X ); axis image; colormap gray; %colorbar;
set( gca, 'XTickMode', 'auto', 'FontSize', 13, 'FontWeight', 'b' );
% waiting = ginput( 1 );

tic;
[Edge_Proposed, TotalCnt_Proposed, RemainCnt_Proposed] = Func_FindBasicEdge_Proposed( X );
Edge_Polygen_Proposed = Func_FindConvexEdge( Edge_Proposed );
toc;

hold on;
plot( Edge_Polygen_Proposed( :, 1 ), Edge_Polygen_Proposed( :, 2 ), 'Color', 'k','LineWidth',1 );
hold off;
Prop_S = (RemainCnt_Proposed / TotalCnt_Proposed) * 100.00;
%%

