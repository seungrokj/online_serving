max_num_seqs=256
max_seq_len_to_capture=131072
max_num_batched_tokens=131072
max_model_len=8192
model=meta-llama/Llama-3.1-70B-Instruct
python3 -m vllm.entrypoints.openai.api_server \
        --model $model \
        --gpu-memory-utilization 0.9 \
        --swap-space 16 \
        --disable-log-requests \
        --dtype float16 \
        --tensor-parallel-size 8  \
        --host 0.0.0.0 \
        --port 8000 \
        --num-scheduler-steps 10 \
	--enable-chunked-prefill False \
	--max-num-seqs $max_num_seqs \
	--max-seq-len-to-capture $max_seq_len_to_capture \
	--max-num-batched-tokens $max_num_batched_tokens \
	--max-model-len $max_model_len \
        --distributed-executor-backend "mp"

        #--kv_cache_dtype fp8 \
        #--quantization fp8 \
