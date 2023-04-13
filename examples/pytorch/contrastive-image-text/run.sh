LOG_DIR="./logs"
OUTPUT_DIR="./outputs"
mkdir -p $LOG_DIR
mkdir -p $OUTPUT_DIR

model=${1:-"openai/clip-vit-base-patch16"}
bs=${2:-64}
model_name=${model#*/}
log_file="${LOG_DIR}/${model_name}.log"
output_dir="${OUTPUT_DIR}/${model_name}"

echo $log_file
echo $output_dir

python3 run_clip.py \
    --model_name_or_path $model \
    --output_dir $output_dir \
    --data_dir  /nas/common_data/data/coco \
    --dataset_name ydshieh/coco_dataset_script \
    --dataset_config_name=2017 \
    --image_column image_path \
    --caption_column caption \
    --remove_unused_columns=False \
    --do_train  --do_eval \
    --per_device_train_batch_size=$bs \
    --per_device_eval_batch_size=$bs \
    --learning_rate="5e-5" --warmup_steps="0" --weight_decay 0.1 \
    --overwrite_output_dir \
    --fp16 \
    # --max_train_samples 20 \
    # --max_eval_samples 2 \
    # --skip_memory_metrics False \
    2>&1 | tee $log_file
