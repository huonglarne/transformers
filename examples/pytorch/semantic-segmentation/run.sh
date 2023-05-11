LOG_DIR="./logs"
OUTPUT_DIR="./outputs"
mkdir -p $LOG_DIR
mkdir -p $OUTPUT_DIR

model=${1:-"google/mobilenet_v2_1.0_224"}
bs=${2:-256}
model_name=${model#*/}
log_file="${LOG_DIR}/${model_name}.log"
output_dir="${OUTPUT_DIR}/${model_name}"

echo $log_file
echo $output_dir

python run_semantic_segmentation.py \
    --model_name_or_path $model \
    --dataset_name segments/sidewalk-semantic \
    --output_dir $output_dir \
    --remove_unused_columns False \
    --do_train \
    --do_eval \
    --evaluation_strategy steps \
    --max_steps 10000 \
    --learning_rate 0.00006 \
    --lr_scheduler_type polynomial \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 8 \
    --logging_strategy steps \
    --logging_steps 100 \
    --evaluation_strategy epoch \
    --save_strategy epoch \
    --seed 1337 \
    --report_to none \
    --overwrite_output_dir \
    --save_total_limit 2 \
    --skip_memory_metrics False \
    2>&1 | tee $log_file
