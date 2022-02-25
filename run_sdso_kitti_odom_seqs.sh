#!/bin/sh

# Loop through KITTI Sequences 00-10
max=5

for i in 00 01 02 03 04 05 06 07 08 09 10;
do
    # Run each sequence 5 times
    for k in `seq 1 $max`
    do
    echo "[$k/5] Running Stereo DSO on KITTI Odometry sequence $i..."

    # build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./kitti_camera.txt preset=0 mode=1
    build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./kitti_camera.txt preset=0 mode=1 nogui=1 > /dev/null  # Silent

    mv "results/result.txt" "results/result_sdso_kitti_seq${i}_${k}_raw.txt"
    done
    echo
done

echo "Finished!"