# main function is used to make all configurations and making results

import argparse
import get_dataset as dataset
import trainer


def gen_config(args):
    config = dict()
    config['plant'] = args.plant
    config['mode'] = args.mode
    config['network'] = args.network
    config['continue'] = args.cont
    # changing part:
    config['time_step'] = 1  # predict in segment
    config['c_step'] = 1  # continuous time step
    config['training_epochs'] = 60
    config['batch_size'] = 128
    config['learning_rate'] = 5e-3

    # 数据归一化所需要用到的系数，提前求得数据集中X,V,A,J以及tracking error的最大值，代入其中
    config['scales'] = [33.0, 647, 9.37e3, 1.31e5, 8.59e3]  # 前4个分别对应X,V,A,J，最后一个对应error

    # GRU的输入量长度为12
    # Input(t0)= (X(t0-1),V(t0-1),A(t0-1),J(t0-1),X(t0),V(t0),A(t0),J(t0),X(t0+1),V(t0+1),A(t0+1),J(t0+1))
    config['dim'] = 4 * (config['c_step'] * 2 + config['time_step'])

    # 输入量为预测的误差，一般维度就是1
    config['out_dim'] = config['time_step']

    # params for signals:
    config['file_path'] = 'matlab_work/data/train'

    # log structure
    config['save'] = True
    if (config['mode'] == 'train') and (not config['continue']):
        config['restore'] = False
    else:
        config['restore'] = True

    # the name of saved model
    config['model_name'] = '{}_model_c{}_{}'.format(config['plant'], config['c_step'], config['network'])
    return config


def run(config):
    X, Y = dataset.read_data(config['file_path'])

    mytrainer = trainer.Trainer(config)
    mytrainer.add_data(X, Y)

    if config['mode'] == 'train':
        mytrainer.train()
    elif config['mode'] == 'test':
        mytrainer.test()
    elif config['mode'] == 'implement':
        mytrainer.implement()


if __name__ == '__main__':
    # fix config
    parser = argparse.ArgumentParser(description='config for plant & network & mode')
    parser.add_argument('-p', '--plant', default='pid')
    parser.add_argument('-n', '--network', default='rnn')
    parser.add_argument('-m', '--mode', default='train', choices=['train', 'validation', 'implement'])
    parser.add_argument('-c', '--cont', default=False, choices=[True, False])
    args = parser.parse_args()
    config = gen_config(args)
    run(config)
