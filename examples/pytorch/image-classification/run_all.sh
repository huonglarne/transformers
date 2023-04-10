#!/usr/bin/env bash

#input file might be all_ckpt_a100.txt or all_ckpt_hac.txt
input_file=$1
[[ ! -f $input_file ]] && echo "${input_file} not exist" && exit 1

mkdir -p ./logs

if [[ $HOSTNAME =~ "haca100" ]]; then
    bash mem-daemon-a100 2>&1 >> ./logs/gpu-mem.log &
else
    bash mem-daemon-hac 2>&1 >> ./logs/gpu-mem.log &
fi
daemon_pid=$!

while read model batch_size ; do
    echo Running: $model
    echo Batchsize: $batch_size
    # bash run.sh $model $batch_size 2>&1
    # pyhton train.py
done < $input_file

kill -9 $daemon_pid
echo Done