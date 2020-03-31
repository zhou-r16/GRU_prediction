# Raw_data
* 此部分主要用于生成reference，并保存其在仿真系统中运行的误差
* 具体使用流程：(1)运行`nurbs.m`,获得一条nurbs曲线作为reference；(2)运行Simulink仿真模型，得到对应的error；(3)运行save_data.m，将得到的数据存入pro_data/from_raw_data/i.mat中



## nurbs.m
* 生成NURBS曲线，并将曲线作为Simulink的系统输入，存在Workspace中
## d3_gen.m
* nurbs.m的子函数，用于生成NURBS曲线
## save_data.m
* 将nurb.m生成的轨迹在Simulink运行后，将reference和error等信息保存到pro_data中，进行下一步处理