# #!/usr/bin/env bash

LOG_DIR="./logs"
OUTPUT_DIR="./outputs"
mkdir -p $LOG_DIR
mkdir -p $OUTPUT_DIR

model=${1:-"facebook/data2vec-text-bases"}
bs=${2:-128}
model_name=${model#*/}
log_file="${LOG_DIR}/${model_name}.log"
output_dir="${OUTPUT_DIR}/${model_name}"


python3 ./run_swag.py \
    --model_name_or_path $model \
    --do_train \
    --do_eval \
    --learning_rate 5e-5 \
    --num_train_epochs 3 \
    --output_dir $output_dir \
    --per_device_eval_batch_size $bs \
    --per_device_train_batch_size $bs \
    --overwrite_output \
    --use_auth_token True \
    --save_total_limit 2 \
    2>&1 | tee $log_file