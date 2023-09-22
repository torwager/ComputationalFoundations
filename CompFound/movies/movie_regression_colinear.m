f1 = create_figure('tsplot');

% x predictor, y pred2, z data
tlen = 1;

% Bottom
h1 = drawbox(0, 1, 0, tlen, 'k');

% Top
h2 = drawbox(0, 1, 0, tlen, 'k');
set(h2, 'Zdata', [1 1 1 1], 'FaceColor', 'k', 'FaceAlpha', 0)

% Back vertical
h3 = fill3([0 0 0 0], [0 0 tlen tlen], [0 1 1 0], 'g');
set(h3, 'FaceColor', [.9 .9 1]);

% Back Panel
h4 = fill3([0 0 1 1], [tlen tlen tlen tlen] , [0 1 1 0], 'k');
set(h4, 'FaceAlpha', .5);

% Front Panel
h4 = fill3([0 0 1 1], [0 0 0 0] , [0 1 1 0], 'k');
set(h4, 'FaceAlpha', 0, 'LineWidth', 2);

set(gca, 'XLim', [-1 2], 'YLim', [-1 2]);
xlabel('X1'); ylabel('X2'), zlabel('Data')

view(30, 15)

axis equal
axis vis3d

view(0, 0)

ax1 = gca;

ax2 = axes('Position', [.8 .05 .2 .1])
text(0, 0, 'Tor Wager, C2008', 'FontSize', 18)
axis off

axes(ax1);


%% Generate data

data = .25 *  mvnrnd([2 2 2], [1 .85 .7; .85 1 .7; .7 .7 1], 50);

data(data < 0) = 0;
data(data > 1) = 1;

pred = data(:, 1);
t = data(:, 2);
data = data(:, 3);

color = linspace(0, 1, length(t));

%% Plot it

hp = plot3(pred, t, data, 'go', 'LineWidth', 2);

mov = movie_tools('still',[],1);

%% Rotate and Plot 3-D data
mov = movie_tools('rotate',30,20,mov,2);
mov = movie_tools('rotate',218,36,mov,2);
mov = movie_tools('rotate',30,20,mov,2);


%% Plot predicted
mov = movie_tools('rotate',30,15,mov,1);

plot3(pred, t, 0 * data, 'k.');

for i = 1:length(t)
    
    % 3-D
    plot3(pred(i), t(i), data(i), 'g+');
    
    % pred
    plot3(pred(i), t(i), 0 + .01, 'ko', 'MarkerFaceColor', 'k');
    
    % lines
    lh1 = plot3([pred(i) pred(i)], [t(i) t(i)], [0 data(i)], 'b');
    lh2 = plot3([0 pred(i)], [t(i) t(i)], [data(i) data(i)], 'b');
    
    mov(end+1) = getframe(f1);
    
    %delete(lh1);
    delete(lh2);
    
end

mov = movie_tools('still',mov,1);

%% plot beta plane

X = [pred t ones(length(t), 1)];
b = pinv(X) * data;

h3 = fill3([0 1 1 0], [0 0 tlen tlen], [[0 0 1]*b [1 0 1]*b [1 1 1]*b [0 1 1]*b], 'r', 'FaceAlpha', 1);

mov = movie_tools('still',mov,1);

mov = movie_tools('transparent',1,.5,h3,mov,1);

% marginal fits
% X1 = [0 0 1; 1 0 1];
% fit = X1 * b;
% plot3([0 1], [0 0], fit, 'b', 'LineWidth', 3);
% 
% X1 = [0 0 1; 0 1 1];
% fit = X1 * b;
% plot3([0 0], [0 1], fit, 'b', 'LineWidth', 3);

X1 = [0 mean(t) 1; 1 mean(t) 1];
fit = X1 * b;
ml1 = plot3([0 1], [0 0], fit, 'g', 'LineWidth', 3);

X1 = [mean(pred) 0 1; mean(pred) 1 1];
fit = X1 * b;
ml2 = plot3([1 1], [0 1], fit, 'g', 'LineWidth', 3); % X at 1 for display purposes

mov = movie_tools('rotate',0,0,mov,1);
mov = movie_tools('still',mov,1);

mov = movie_tools('rotate',40,20,mov,1);
mov = movie_tools('rotate',90,0,mov,1);
mov = movie_tools('still',mov,1);

delete(ml1)
delete(ml2)

mov = movie_tools('rotate',40,20,mov,1);
mov = movie_tools('still',mov,1);


%% More planes

for i = 1:12

    data = .25 *  mvnrnd([2 2 2], [1 .85 .7; .85 1 .7; .7 .7 1], 50);

    data(data < 0) = 0;
    data(data > 1) = 1;

    pred = data(:, 1);
    t = data(:, 2);
    data = data(:, 3);

    X = [pred t ones(length(t), 1)];
    b = pinv(X) * data;

    h3 = fill3([0 1 1 0], [0 0 tlen tlen], [[0 0 1]*b [1 0 1]*b [1 1 1]*b [0 1 1]*b], 'r', 'FaceAlpha', .3);

    mov = movie_tools('still',mov,.2);


end

mov = movie_tools('rotate',124,28,mov,1);
mov = movie_tools('still',mov,1);

%%

movie2avi(mov, 'movie_regression_colinear.avi', 'fps', 10);
