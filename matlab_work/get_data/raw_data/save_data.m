rec1.posx = a;
rec1.vx = vx;
rec1.ax = ax;
rec1.jx = jx;
rec1.ex = error_output.Data; % 保存Simulink中输出的误差

save('..\pro_data\from_raw_data\20.mat','rec1');