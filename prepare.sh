#!/usr/bin/env bash
# 执行路径在模型库的根目录下
################################# 安装框架 如:
echo "*******prepare benchmark start ***********"
pip install -U pip
echo `pip --version`

wget  ${FLAG_TORCH_WHL_URL}
tar -xvf  torch_dev_whls.tar
pip install torch_dev_whls/*

echo "PWD = $PWD"

pip install -U openmim
mim install mmcv-full==1.7.1

pip install decord==0.4.2 -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install av==8.0.3 -i https://pypi.tuna.tsinghua.edu.cn/simple
pip install timm

# 安装mmaction2
pip install -v -e .

# 安装apex用于amp训练
git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
cd ..


# 改一下预训练模型 
wget https://videotag.bj.bcebos.com/Data/swin_small_patch244_window877_kinetics400_1k.pth

################################# 准备训练数据:
mkdir data
wget https://videotag.bj.bcebos.com/Data/k400_videos_small.tar \
    -O data/k400_videos_small.tar
tar -zxvf data/k400_videos_small.tar -C data/
echo "*******prepare benchmark end***********"