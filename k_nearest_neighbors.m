%K-nearest-neighbors implementation in MATLAB
clear, clc;
rng(1); %reproducibilitet
k = 3; %antal kluster

x_list = [-2; 1.08; 4; 7; 2; 1.11; 1.72; -3.77; -1.111];
y_list = [4; -1; 5; 8; 4.12; 4.23; 5.81; 11.09; 2.18];

data_coords = [x_list y_list];

d_mat = distance_matrix(data_coords);

A = k_nearest_neighbor(d_mat, k);

function knn_mat = k_nearest_neighbor(mat, k)
    n = height(mat);
    knn_mat = zeros(k, k);
    for i = 1:n
        [~, index] = sort(mat(i, :));
        knn_mat(i, :) = index(2:k + 1); %0 är exkluderat
    end
end

function d_m = distance_matrix(list)
    l = height(list);
    d_m = zeros(l, l);
    for i = 1:l
        for j = 1:l
            d_m(i, j) = euclidian_distance(list(i, :), list(j, :));
        end
    end
end

function d = euclidian_distance(point_1, point_2)
    d = sqrt((point_1(1, 1) - point_2(1, 1))^2 + (point_1(1, 2) - point_2(1, 2))^2);
end

%used for further development
function max = find_max(list)
    max = 0;
    for i = 1:length(list)
       if list(i) > max
           max = list(i);
       end
    end
    return
end

%used for further development
function min = find_min(list)
    min = 0;
    for i = 1:length(list)
       if list(i) < min
           min = list(i);
       end
    end
    return
end

