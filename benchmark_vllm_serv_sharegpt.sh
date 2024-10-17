#PROMPTS="128 500"
PROMPTS="128"
QPS="1 8 16 inf"

for prompts in $PROMPTS; do
    for qps in $QPS; do
        python3 /app/vllm/benchmarks/benchmark_serving.py \
            --backend vllm \
            --model meta-llama/Meta-Llama-3.1-8B-Instruct \
            --dataset-name sharegpt \
            --dataset-path ./ShareGPT_V3_unfiltered_cleaned_split.json \
            --num-prompts $prompts \
            --port 8000 \
            --save-result  \
            --result-dir results/ \
            --result-filename Llama-3.1-8B-Instruct_tp8_req${prompts}_qps${qps}.json \
            --request-rate ${qps}
    done
done
