# 使用 Huggingface Accelerate分布式训练
export CUDA_VISIBLE_DEVICES=6,7 && CUDA_LAUNCH_BLOCKING=1 && PYTORCH_CUDA_ALLOC_CONF="max_split_size_mb=982"
accelerate launch  src/train_bash.py \
    --stage pt \
    --model_name_or_path /data1/hhj/model/Baichuan2-7B-Base \
    --output_dir /data1/hhj/repo/law-LLM/output \
    --dataset qss_fact \
    --template default \
    --do_train \
    --finetuning_type lora \
    --lora_target W_pack  \
    --overwrite_cache \
    --per_device_train_batch_size 2 \
    --gradient_accumulation_steps 2 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 5e-5 \
    --num_train_epochs 3.0 \
    --plot_loss \
    --fp16