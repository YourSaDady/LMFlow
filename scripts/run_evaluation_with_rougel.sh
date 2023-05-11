#!/bin/bash

# --model_name_or_path specifies the original huggingface model
# --lora_model_path specifies the model difference introduced by finetuning,
#   i.e. the one saved by ./scripts/run_finetune_with_lora.sh
CUDA_VISIBLE_DEVICES=0 \
    deepspeed examples/evaluate.py \
    --answer_type text \
    --model_name_or_path gpt2-large \
    --dataset_path data/alpaca/test \
    --prompt_structure "Input: {input}" \
    --deepspeed examples/ds_config.json \
    --metric rouge-l