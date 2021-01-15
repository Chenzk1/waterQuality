import os,sys
import pdb
import argparse


def parse_args():
    parser = argparse.ArgumentParser(description='FS')
    # config
    parser.add_argument('-p', '--file-path', default='/home/chenzhongkai/wq/mzh/data/fs_data_0805_divide_pi.csv',
                        type=str)

    args = parser.parse_args()

    for key in args.__dict__.keys():
        print(key, ':', args.__dict__[key])
    return args

def main(args):
    with open(args.file_path, 'r') as f:
        lines = f.readlines()
        flag = False
        tmp = []
        for line in lines:
            if flag:
                tmp.append(line)
            if line.startswith("wavelength = {"): flag = True
        
        tmp[-1] = tmp[-1][:-2]
        ans = []
        for tmp_ in tmp:
            cur_line = tmp_.split(',')
            for cur in cur_line:
                if cur=="\n": continue
                try:
                    cur_ = round(float(cur))
                    ans.append(cur_)
                except: 
                    pdb.set_trace()
                    pass
        print('\n'.join(map(str, ans)))

if __name__=="__main__":
    args = parse_args()
    main(args)