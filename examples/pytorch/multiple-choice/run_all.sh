#!/usr/bin/env bash
export TRANSFORMERS_CACHE=/nas/huggingface_pretrained_models
export HF_DATASETS_CACHE=/nas/common_data/huggingface

#input file might be all_ckpt_a100.txt or all_ckpt_hac.txt
input_file=$1
[[ ! -f $input_file ]] && echo "${input_file} not exist" && exit 1

mkdir -p ./logs

# if [[ $HOSTNAME =~ "haca100" ]]; then
#     bash mem-daemon-a100 2>&1 >> ./logs/gpu-mem.log &
# else
#     bash mem-daemon-hac 2>&1 >> ./logs/gpu-mem.log &
# fi
# daemon_pid=$!

while read model batch_size ; do
    echo Running: $model
    echo Batchsize: $batch_size
    bash run_swag.sh $model $batch_size 2>&1
done < $input_file

# kill -9 $daemon_pid
echo Done