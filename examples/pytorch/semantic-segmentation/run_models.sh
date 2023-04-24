# bash run.sh $model $bs
# bash mem-daemon-a100 2>&1 >> ./logs/gpu-mem.log &

input_file=${1:-"model_names.txt"}

while read model batch_size ; do
    echo Running: $model
    echo Batchsize: $batch_size
    bash run.sh $model $batch_size
done < $input_file