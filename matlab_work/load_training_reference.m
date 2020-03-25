% load('.\data\train\training_reference_2.mat');
% t = 0:0.005:104; 
% t = t';
% y = training_reference(10,:)';

% training_error = [];
% training_error = [training_error error(:,2)];
% 
% training_reference_error_2 = training_error(1:10:end,:);
% training_reference_error_2 = training_reference_error_2';
% save('.\data\train\training_reference_error_2.mat', 'training_reference_error_2');

% load('.\data\train\training_reference_2.mat');
% load('.\data\train\training_reference_error_2.mat');
% 
% training_reference(:,end)=[];
% training_reference_error_2(:,end)=[];
% 
% xx = [];
% yy = [];
% for i = 1:10
%     tmp = training_reference(i,:);
%     xx = [xx;reshape(tmp, 1040, 20)'];
%     
%     tmp = training_reference_error_2(i,:);
%     yy = [yy;reshape(tmp, 1040, 20)'];
% end

% save('.\data\train\training_reference_2.mat', 'xx');
% save('.\data\train\training_reference_error_2.mat', 'yy');

% load('.\data\train\training_reference.mat');
% load('.\data\train\training_reference_2.mat');
% load('.\data\train\training_reference_error.mat');
% load('.\data\train\training_reference_error_2.mat');
% x = [x;xx];
% y = [y;yy];
% 
% save('.\data\train\training_reference.mat', 'x');
% save('.\data\train\training_reference_error.mat', 'y');