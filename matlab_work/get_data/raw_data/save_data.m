rec1.posx = a;
rec1.vx = vx;
rec1.ax = ax;
rec1.jx = jx;
rec1.ex = error(:,2); % 保存Simulink中输出的误差

save('..\pro_data\from_raw_data\1.mat','rec1');