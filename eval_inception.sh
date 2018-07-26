#!/bin/bash

#for i in {101..119}
for ((i=41;i>=0;i-=2)); do
    CUDA_VISIBLE_DEVICES=1,2 python ./eval_inception.py \
        --model resnet_32 \
        --model_in ./ckpt.acgan/gen_epoch_$i.pth \
        --nz 128 \
        --ngf 64 \
        --nclass 10 \
        --nimgs 50000 \
        --batch_size 100 \
        --start_width 4 \
        --splits 10 \
        --ngpu 2 #| tee -a score_adv_32px.txt
done