close all; clear; clc;

%totalcount = 3276800;%4000000
%X = Func_GenCircleP(totalcount);
%X = Func_GenRectangleP(totalcount);
%X = Func_GenSparseP();
%X = Func_GenTriangleP();
%X = Func_LoadData( './Data/star.dat' );%ReadFile
%X = Func_LoadPLY( './Data/Reindeer.ply' );% Astar_New, Bull, Bison, Camel，Elephant_African，Elephant_Asian， Pig， Polar， Reindeer.--------------- % --Attention: Astar_New can not be loaded with small GridPrecision!
%------------------------------------------
RoughData = load('./Data/Bull.mat');% Astar_New, Bull，Camel，Elephant_African，Elephant_Asian， Pig， Polar， Reindeer
X = RoughData.X;
%------------------------------------------


%%
Th = 0.8;
Idx = find( X < Th );
X( Idx ) = nan;

%figure; imagesc( X ); axis image; %colorbar;
% tic;
% Edge_origin = Func_FindConvexEdge( X );
% toc;

%%
figure; imagesc( X ); axis image; %colorbar;
set( gca, 'XTickMode', 'auto', 'FontSize', 13, 'FontWeight', 'b' );
% waiting = ginput( 1 );%显示原始点云，等待鼠标单击

tic;
[Edge_Jose, TotalCnt_Jose, RemainCnt_Jose] = Func_FindBasicEdge_Jose( X );
hold on;
plot( Edge_Jose( :, 1 ), Edge_Jose( :, 2 ), 'Color', 'r' );

Edge_Polygen_Jose = Func_FindConvexEdge( Edge_Jose );
hold on;
plot( Edge_Polygen_Jose( :, 1 ), Edge_Polygen_Jose( :, 2 ), 'Color', 'w', 'LineWidth',1 );%需根据情况调整线宽
toc;

Jose_S = (RemainCnt_Jose / TotalCnt_Jose) * 100.00;

%%
figure; imagesc( X ); axis image; %colorbar;
set( gca, 'XTickMode', 'auto', 'FontSize', 13, 'FontWeight', 'b' );
% waiting = ginput( 1 );%显示原始点云，等待鼠标单击

tic;
[Edge_Proposed, TotalCnt_Proposed, RemainCnt_Proposed] = Func_FindBasicEdge_Proposed( X );
hold on;
plot( Edge_Proposed( :, 1 ), Edge_Proposed( :, 2 ), 'Color','w' );

Edge_Polygen_Proposed = Func_FindConvexEdge( Edge_Proposed );
hold on;
plot( Edge_Polygen_Proposed( :, 1 ), Edge_Polygen_Proposed( :, 2 ), 'Color', 'w','LineWidth',1 );%需根据情况调整线宽
toc;

Prop_S = (RemainCnt_Proposed / TotalCnt_Proposed) * 100.00;
