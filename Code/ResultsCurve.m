close all; clear; clc;
%%
% --Circle Runtime
Count = [200, 400, 800, 1600, 3200, 6400, 12800, 25600, 51200, 102400, 204800, 409600, 819200, 1638400, 3276800];
Graham_RunTime = [0.257186, 0.256601, 0.279733, 0.260661, 0.265649, 0.270049, 0.274746, 0.301029, 0.549728, 1.544234, 5.754535, 22.35535, 143.625731, 732.884762, 3546.340372];
% Jose_Runtime = [0.647673, 0.648937, 0.640673, 0.63693, 0.612792, 0.604245, 0.573890, 0.580336, 0.559144, 0.567513, 0.559967, 0.569032, 0.586535, 0.590869, 0.704262];
LiuBin_RunTime = [0.097173, 0.065634, 0.065486, 0.071915, 0.069874, 0.075136, 0.089006, 0.117034, 0.160636, 0.256290, 0.472141, 0.912115, 1.752320, 3.470768, 7.109616];
Proposed_RunTime = [0.766801, 0.748454, 0.735341, 0.691190, 0.657737, 0.630080, 0.584441, 0.498973, 0.475816, 0.468986, 0.454016, 0.470263, 0.457621, 0.454824, 0.456267];
%%
% --Animals runtime
% Pig, Reindeer, Polar, Bull, Camel, Bison, ElephantAsian, ElephantAfrican
% Count = [291302, 387599, 448164, 643854, 894501, 935459, 2275433, 3092452];
% Graham_RunTime = [15.790457, 32.702687, 27.761399, 270.399799, 402.460202, 958.438812, 2536.521452, 4004.466654];
% LiuBin_RunTime = [0.766050, 0.968105, 1.095336, 1.511904, 2.170382, 2.274250, 4.791044, 6.522762];
% Proposed_RunTime = [0.186168, 0.346781, 0.200522, 0.272846, 0.560248, 0.592791, 0.893361, 0.997676];
%%

figure;
set( gca, 'FontSize', 13, 'FontWeight', 'b' );
hold on;
plot(Count, log(Graham_RunTime), '-.', 'LineWidth', 2);
plot(Count, log(LiuBin_RunTime), '--','LineWidth', 2);
plot(Count, log(Proposed_RunTime), 'LineWidth', 2);

hold off;


