#!/usr/bin/env bash

input_file=${1:-"model_names.txt"}
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
    bash run.sh $model $batch_size
done < $input_file

kill -9 $daemon_pid
echo Done