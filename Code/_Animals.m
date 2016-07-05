close all; clear all; clc;

%totalcount = 200;%4000000
%X = Func_GenCircleP(totalcount);
%X = Func_GenRectangleP(totalcount);
%X = Func_GenSparseP();
%X = Func_GenTriangleP();
%X = Func_LoadData( './Data/star.dat' );%ReadFile
%X = Func_LoadPLY( './Data/Pig.ply' );%ReadFile
%------------------------------------------
struct1 = load('./Data/Elephant_Asian_0.0005.mat');% Camel_0.0005£¬ bull_0.0005£¬ Camel_0.0005£¬Elephant_African_0.0005£¬Elephant_Asian_0.0005£¬ Pig_0.0005£¬ Polar_0.0005£¬ Reindeer_0.0005
X = struct1.X;
%------------------------------------------
Th = 0.8;
Idx = find( X < Th );
X( Idx ) = nan;
%

%%
tic;
Edge_origin = Func_FindConvexEdge( X );
toc;

%%
tic;
[Edge_Jose, TotalCnt_Jose, RemainCnt_Jose] = Func_FindBasicEdge_Jose( X );
Edge_Polygen_Jose = Func_FindConvexEdge( Edge_Jose );
toc;

%%
tic;
[Edge_Proposed, TotalCnt_Proposed, RemainCnt_Proposed] = Func_FindBasicEdge_Proposed( X );
Edge_Polygen_Proposed = Func_FindConvexEdge( Edge_Proposed );
toc;
