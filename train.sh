# LoRA微调
# 环境：conda activate llama_etuning
export CUDA_VISIBLE_DEVICES=4,5,6,7
torchrun --nproc_per_node 4 --master_port 6124 /data1/hhj/repo/law-LLM/LLaMA-Efficient-Tuning/src/train_bash.py \
--stage sft \
--model_name_or_path /data1/hhj/model/DISC-LawLLM \
--do_train \
--dataset alpaca_gpt4_zh \
--template baichuan \
--finetuning_type lora \
--lora_rank 8 --lora_target W_pack \
--output_dir /data1/hhj/repo/law-LLM/output \
--overwrite_cache \
--per_device_train_batch_size 4 \
--per_device_eval_batch_size 4 \
--gradient_accumulation_steps 8 \
--preprocessing_num_workers 16 \
--lr_scheduler_type cosine \
--logging_steps 10 \
--save_steps 100 \
--eval_steps 100 \
--learning_rate 1e-5 \
--max_grad_norm 0.5 \
--num_train_epochs 2.0 \
--val_size 0.01 \
--evaluation_strategy steps \
--load_best_model_at_end \
--plot_loss \
--fp16
    