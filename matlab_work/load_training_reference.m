% load('.\data\training_reference.mat');
% t = 0:0.005:104; 
% t = t';
% y = training_reference(1,:)';
% 
% % training_error = [];
% % training_error = [training_error error(:,2)];
% 
% training_reference_error = training_error(1:10:end,:);
% training_reference_error = training_reference_error';
% save('.\data\training_reference_error.mat', 'training_reference_error');

load('.\data\training_reference.mat');
load('.\data\training_reference_error.mat');

training_reference(:,end)=[];
training_reference_error(:,end)=[];

x = [];
y = [];
for i = 1:10
    tmp = training_reference(i,:);
    x = [x;reshape(tmp, 1040, 20)'];
    
    tmp = training_reference_error(i,:);
    y = [y;reshape(tmp, 1040, 20)'];
end

save('.\data\training_reference.mat', 'x');
save('.\data\training_reference_error.mat', 'y');