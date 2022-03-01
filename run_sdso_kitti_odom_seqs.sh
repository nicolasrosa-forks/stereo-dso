#!/bin/bash

# Loop through KITTI Sequences 00-10
max=5

# kitti_seqs="00 01 02"
# kitti_seqs="03"
# kitti_seqs="04 05 06 07 08 09 10 11 12"
kitti_seqs="00 01 02 03 04 05 06 07 08 09 10 11 12"

for i in $kitti_seqs
do
    echo "[Running sequence $i...]"
    # Run each sequence 5 times
    for k in `seq 1 $max`
    do
        echo "[$k/5] Running Stereo DSO on KITTI Odometry sequence $i..."

        if [ "$i" = "00" ] || [ "$i" = "01" ] || [ "$i" = "02" ]
        then
            # build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti00-02.txt preset=0 mode=1
            build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti00-02.txt preset=0 mode=1 nogui=1 > /dev/null  # Silent
        elif [ "$i" = "03" ]
        then
            # build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti03.txt preset=0 mode=1
            build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti03.txt preset=0 mode=1 nogui=1 > /dev/null  # Silent
        elif [ "$i" = "04" ] || [ "$i" = "05" ] || [ "$i" - "06" ] || [ "$i" = "07" ] || [ "$i" = "08" ] || [ "$i" = "09" ] || [ "$i" = "10" ] || [ "$i" = "11" ] || [ "$i" = "12" ]
        then
            # build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti04-12.txt preset=0 mode=1
            build/bin/dso_dataset files=/media/nicolas/nicolas_seagate/datasets/kitti/odometry/dataset/sequences/$i calib=./camera_kitti04-12.txt preset=0 mode=1 nogui=1 > /dev/null  # Silent
        fi
        mv "results/result.txt" "results/result_sdso_kitti_seq${i}_${k}_raw.txt"
    done
    echo
done

echo "Finished!"