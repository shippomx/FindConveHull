clc;
clear;
close all;


%%
RoughData = load('./Data/Reindeer_Pure.mat'); %, Bull_Pure, Bison_Pure, Camel_Pure, Elephant_African_Pure, Elephant_Asian_Pure, Pig_Pure, Polar_Pure, Reindeer_Pure. 
Xw = RoughData.X;
% --start the timer.
tic;
[XLength, XWidth] = size(Xw);
% figure;
% axis image;
% plot(Xw(:, 1),Xw(:, 2),'.', 'Color', 'b');
% hold on;

%%
% The first coordinate of the principal component scores gives the projection of each point onto the line. 
% As with the 2-D fit, the PC coefficient vectors multiplied bX the scores the gives the fitted points in the original coordinate sXstem.
[coeff, score, roots] = pca(Xw);
dirVect = coeff(:, 1);
meanX = mean(Xw, 1);

t = [min(score(:, 1)) - .2, max(score(:, 1)) + .2];
endpts = [meanX + t(1) * dirVect'; meanX + t(2) * dirVect'];
% axis image;
% ----------------------Draw the split line pca
% plot(endpts(:, 1),endpts(:, 2), 'r-');

%%
% ----------------------Transfer to OL coordinates.
if endpts(1, 2) - endpts(2, 2) == 0
    Normal_W = [0, 1];
else
    tmp_Normal = coeff(:, 2)';
    Normal_W = [1, tmp_Normal(1, 2) / tmp_Normal(1, 1)];
end

P_Ol = [sum(Xw(:, 1)) / XLength, sum(Xw(:, 2)) / XLength];
% plot(P_Ol(1, 1), P_Ol(1, 2), '.', 'Color', 'g', 'LineWidth', 1);% Draw the OL center point

Xl = zeros(XLength, XWidth);
for pos = 1 : XLength
    Xl(pos, 2) = (P_Ol(1, 1) - Xw(pos, 1)) * Normal_W(1, 1) + (P_Ol(1, 2) - Xw(pos, 2)) * Normal_W(1, 2);
    Xl(pos, 1) = (Xw(pos, 1) - P_Ol(1, 1)) * Normal_W(1, 2) - (Xw(pos, 2) - P_Ol(1, 2)) * Normal_W(1, 1);
end

% -------------------sort the points cloud in the first column
Xl(:, 1) = -Xl(:, 1);
Xl_orderd = sortrows(Xl, 1);
Pl_start = [Xl_orderd(1, 1), Xl_orderd(1, 2)];
Pl_end = [Xl_orderd(end, 1), Xl_orderd(end, 2)];
P_On = [(Pl_start(1, 1) + Pl_end(1, 1)) / 2, (Pl_start(1, 2) + Pl_end(1, 2)) / 2];

% -- Draw the Xl points cloud

% figure;
% hold on;
% plot(Xl(:, 1), Xl(:, 2), '.', 'Color', 'm');
% plot(P_On(1, 1), P_On(1, 2), '.', 'Color', 'g', 'LineWidth', 1);
% plot(Pl_start(1, 1), Pl_start(1, 2), '.', 'Color', 'g', 'LineWidth', 1);
% plot(Pl_end(1, 1), Pl_end(1, 2), '.', 'Color', 'g', 'LineWidth', 1);
% hold off;
% axis image;

%%
%---------------Transfer to ON coordinatess.

if Pl_end(1, 2) - Pl_start(1, 2) == 0
    Normal_L = [0, 1];
else
    Normal_Split_L = -((Pl_end(1, 1) - Pl_start(1, 1)) / (Pl_end(1, 2) - Pl_start(1, 2)));
    Normal_L = [1, Normal_Split_L];
end

Xn = zeros(XLength, XWidth);
for pos = 1 : XLength
    Xn(pos, 2) = (P_On(1, 1) - Xl_orderd(pos, 1)) * Normal_L(1, 1) + (P_On(1, 2) - Xl_orderd(pos, 2)) * Normal_L(1, 2);
    Xn(pos, 1) = (Xl_orderd(pos, 1) - P_On(1, 1)) * Normal_L(1, 2) - (Xl_orderd(pos, 2) - P_On(1, 2)) * Normal_L(1, 1);
end
Xn(:, 1) = -Xn(:, 1);
Pn_start = [Xn(1, 1), Xn(1, 2)];
Pn_end = [Xn(end, 1), Xn(end, 2)];

figure; 
set( gca, 'FontSize', 13, 'FontWeight', 'b' );
hold on;
plot(Xn(:, 1), -Xn(:, 2), '.', 'Color', 'b', 'LineWidth', 0.02);

% plot(Pn_start(1, 1), Pn_start(1, 2), '.', 'Color', 'g', 'LineWidth', 1);
% plot(Pn_end(1, 1), Pn_end(1, 2), '.', 'Color', 'g', 'LineWidth', 1);
hold off;
axis image;

%%
%-----------------Split the Xn points.
cnt_Pos = 0;
cnt_Neg = 0;
Xn_Pos = zeros(XLength, XWidth);
Xn_Neg = zeros(XLength, XWidth);
for pos = 1 : XLength
    if Xn(pos, 2) >= 0
        cnt_Pos = cnt_Pos + 1;
        Xn_Pos(cnt_Pos, :)= Xn(pos, :);
    else
        cnt_Neg = cnt_Neg + 1;
        Xn_Neg(cnt_Neg, :)= Xn(pos, :);
    end
end
Xn_Pos = sortrows(Xn_Pos(1 : cnt_Pos, :), 1);
Xn_Neg = sortrows(Xn_Neg(1 : cnt_Neg, :), 1);
% hold on;
% plot(Xn_Neg(:, 1), Xn_Neg(:, 2), '.', 'Color', 'b');
% plot(Xn_Pos(:, 1), Xn_Pos(:, 2), '.', 'Color', 'm');
% hold off;

%%
%-------------Build the convex hull.

% --the four points
tmp_Pos_Y = sortrows(Xn_Pos, 2);
tmp_Neg_Y = sortrows(Xn_Neg, 2);
P_base_upper = tmp_Pos_Y(end, :);
P_base_bottom = tmp_Neg_Y(1, :);
P_base_right = Pn_end;
% hold on;
% plot(P_base_upper(1, 1), P_base_upper(1, 2), '.', 'Color', 'g');
% plot(P_base_bottom(1, 1), P_base_bottom(1, 2), '.', 'Color', 'g');
% hold off;

[tPos_X_upper, ~] = find(Xn_Pos == P_base_upper(1, 1));
Pos_X_upper = tPos_X_upper(1, 1);
Pos_X_right = cnt_Pos;

%-----------The upper parts
X_CvxPos = PCA_Find_Convexhull(Xn_Pos, 1, Pos_X_upper);
X_CvxPos = PCA_Find_Convexhull(X_CvxPos, Pos_X_upper, Pos_X_right);

%-----------The bottom parts
[tNeg_X_bottom, ~] = find(Xn_Neg == P_base_bottom(1, 1));
Neg_X_bottom = tNeg_X_bottom(1, 1);
Neg_X_right = cnt_Neg;

% --transfer the bottom parts to upper parts, after the transfer, back to the bottom parts
Xn_Neg(:, 2) = -Xn_Neg(:, 2);
t_X_CvxNeg = PCA_Find_Convexhull(Xn_Neg, 1, Neg_X_bottom);
t_X_CvxNeg = PCA_Find_Convexhull(t_X_CvxNeg, Neg_X_bottom, Neg_X_right);
X_CvxNeg(:, 2) = -t_X_CvxNeg(:, 2);
X_CvxNeg(:, 1) = t_X_CvxNeg(:, 1);

% -----------put convex hull points in a more simply array.
% --upper parts
tX_CvxPos = zeros(1000, 2);
countPos = 0;
for i = 1 : cnt_Pos
    if ~isnan( X_CvxPos(i, 1) )
        countPos = countPos + 1;
        tX_CvxPos(countPos, :) = X_CvxPos(i, :);
    end
end

% --bottom parts
countNeg = 0;
tX_CvxNeg = zeros(1000, 2);
for i = 1 : cnt_Neg
    if ~isnan( X_CvxNeg(i, 1) )
        countNeg = countNeg + 1;
        tX_CvxNeg(countNeg, :) = X_CvxNeg(i, :);
    end
end

X_Cvx = zeros(countPos + countNeg + 1, 2);
X_Cvx(1 : countPos, :) = tX_CvxPos(1 : countPos, :);
for i = 1 : countNeg
    X_Cvx(countPos + i, :) = tX_CvxNeg(countNeg - i + 1, :);
end
X_Cvx(countPos + countNeg + 1, :) = X_Cvx(1, :); % take the first point as the start point and the end point.

%%
toc;
% ------ Done!

hold on;
plot(X_Cvx(:, 1), -X_Cvx(:, 2), 'Color', 'g', 'LineWidth', 2);
hold off;
axis image;

