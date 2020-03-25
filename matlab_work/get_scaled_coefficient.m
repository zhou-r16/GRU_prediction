load('.\data\train\training_reference.mat');
load('.\data\train\training_reference_error.mat');

max_X = -inf;
max_V = -inf;
max_A = -inf;
max_J = -inf;
max_Y = -inf;

for i = 1:size(x,1)
    origin_X = x(i,:);
    Y = y(i,:);
    V_tmp = origin_X(2:end) - origin_X(1:end-1);
    A = V_tmp(2:end) - V_tmp(1:end-1);
    V = (origin_X(3:end) - origin_X(1:end-2)) / 2;
    J = (A(3:end) - A(1:end-2)) / 2;

    X = origin_X(3:end-2);
    V = V(2:end-1);
    A = A(2:end-1);
    
    Y = Y(3:end-2);
    
    max_X = max(max_X, max(X));
    max_V = max(max_V, max(V));
    max_A = max(max_A, max(A));
    max_J = max(max_J, max(J));
    max_Y = max(max_Y, max(Y));
end

scale = [1/max_X 1/max_V 1/max_A 1/max_J 1/max_Y];