close all; clear; clc;
% Sparse = [200, 400, 800, 1600, 3200, 6400, 12800, 25600, 51200, 102400, 204800, 409600, 819200, 1638400, 3276800];
% Graham = [0.257186, 0.256601, 0.279733, 0.260661, 0.265649, 0.270049, 0.274746, 0.301029, 0.549728, 1.544234, 5.754535, 22.35535, 143.625731, 732.884762, 3546.340372];
% Jose = [0.647673, 0.648937, 0.640673, 0.63693, 0.612792, 0.604245, 0.573890, 0.580336, 0.559144, 0.567513, 0.559967, 0.569032, 0.586535, 0.590869, 0.704262];
% Proposed = [0.9915946, 0.904185, 0.895455, 0.847581, 0.811349, 0.630080, 0.584441, 0.545996, 0.536761, 0.519304, 0.520105, 0.511880, 0.518517, 0.505778, 0.589504];
%%

%plot(Sparse, Graham, '-.', Sparse, Jose, '--', Sparse, Proposed);
% plot(Sparse, Jose, Sparse, Proposed);
% plot1 = plot(X1,YMatrix1,'Parent',axes1,'LineWidth',2);
% set(plot1(1),'LineStyle','-.','DisplayName','Graham');
% set(plot1(2),'LineStyle','--','DisplayName','Jose');
% set(plot1(3),'DisplayName','Proposed');
% title('Comparision of three algorithms');
% xlabel('Vaild points');
% ylabel('Runtime(s)');

%%
% --Animals runtime
%Pig, Reindeer, Polar, Bull, Camel, Bison, ElephantAsian, ElephantAfrican
% Count = [291302, 387599, 448164, 643854, 894501, 935459, 2275433, 3092452];
% Graham_RunTime = [15.790457, 32.702687, 27.761399, 270.399799, 402.460202, 958.438812, 2536.521452, 4004.466654];
% LiuBin_RunTime = [3.134264, 4.042839, 4.459322, 7.212662, 10.941801, 12.557851, 28.629290, 45.468596];
% Proposed_RunTime = [0.186168, 0.346781, 0.200522, 0.272846, 0.560248, 0.733160, 1.044102, 1.213468];
Count = [291302, 387599, 448164, 643854, 894501];
Graham_RunTime = [15.790457, 32.702687, 27.761399, 270.399799, 402.460202];
LiuBin_RunTime = [3.134264, 4.042839, 4.459322, 7.212662, 10.941801];
Proposed_RunTime = [0.186168, 0.346781, 0.200522, 0.272846, 0.560248];

figure;
set( gca, 'FontSize', 13, 'FontWeight', 'b' );
hold on;
plot(Count, Graham_RunTime, '-.', 'LineWidth', 2);
plot(Count, LiuBin_RunTime, '--','LineWidth', 2);
plot(Count, Proposed_RunTime, 'LineWidth', 2);

hold off;


