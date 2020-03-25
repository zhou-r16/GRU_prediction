training_reference = [];

for i = 1:10
    curve = nurbs_generator(3,100,0.03,1.5);
    training_reference = [training_reference;curve(:,2)'];
    fprintf('Successfully generate training reference %d\n',i)
end

save('.\data\training_reference.mat', 'training_reference');