python tools/train.py \
       configs/recognition/swin/swin_small_patch244_window877_kinetics400_1k.py \
       --cfg-options model.backbone.pretrained=./swin_small_patch4_window7_224_22k.pth \
       model.backbone.use_checkpoint=True #compile=True

# bash tools/dist_train.sh configs/recognition/swin/swin_small_patch244_window877_kinetics400_1k.py 4 \
#     --cfg-options model.backbone.pretrained=./swin_small_patch4_window7_224_22k.pth \
#     model.backbone.use_checkpoint=True