clear; clc, close all;


data = [data; data + change];
figure(1)
n = size(data, 1);
% forma_data = data ./ repmat(sum(data .* data).^0.5, n, 1);
forma_data = zscore(data);
distance = pdist(forma_data);
square_distance = squareform(distance);
Tree = linkage(distance);
dendrogram(Tree);
ans = cluster(Tree, 3);

figure(2)
x = 1:M;
plot(x, ans(1:M), 'g-h', 'LineWidth', 2);
hold on;
plot(x, ans(M + 1:2 * M), 'r-x', 'LineWidth', 2);
