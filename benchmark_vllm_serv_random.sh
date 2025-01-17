PROMPTS="256"
QPS="inf"
CON="1 2 4 8 16 32 64 128 256"
INPUTS="512"
OUTPUTS="64"
MODEL_NAME=

for isl in $INPUTS; do
    for osl in $OUTPUTS; do
	for prompts in $CON; do
	    for con in $CON; do
		for qps in $QPS; do
		    #echo "[RUNNING] req $prompts isl $isl osl $osl con $con qps $qps"
		    prompts=$con
		    echo "[RUNNING] req $prompts isl $isl osl $osl con $con qps $qps"
		    python3 /app/vllm/benchmarks/benchmark_serving.py \
			--backend vllm \
			--model meta-llama/Llama-3.1-70B-Instruct \
			--dataset-name random \
			--num-prompts $prompts \
			--random-input-len $isl \
			--random-output-len $osl \
			--random-range-ratio 1.0 \
			--request-rate ${qps} \
			--max-concurrency $con \
			--ignore-eos \
			--port 8000 \
			--percentile-metrics "ttft,tpot,itl,e2el"
		done
	    done
	done
    done
done





#echo "[INFO] req $PROMPTS inp 128 out 128"
#for prompts in $PROMPTS; do
#    for qps in $QPS; do
#        python3 /app/vllm/benchmarks/benchmark_serving.py \
#            --backend vllm \
#            --model amd/Meta-Llama-3.1-405B-Instruct-FP8-KV \
#            --dataset-name random \
#            --num-prompts $prompts \
#            --random-input-len 128 \
#            --random-output-len 128 \
#            --random-range-ratio 1.0 \
#            --max-concurrency $CON \
#            --ignore-eos \
#            --port 8000 \
#            --save-result  \
#            --result-dir results/ \
#            --result-filename Meta-Llama-3.1-405B-Instruct-FP8-KV_tp8_req${prompts}_qps${qps}.json \
#            --request-rate ${qps}
#    done
#done

#echo "[INFO] req $PROMPTS inp 2048 out 128"
#for prompts in $PROMPTS; do
#    for qps in $QPS; do
#        python3 /app/vllm/benchmarks/benchmark_serving.py \
#            --backend vllm \
#            --model amd/Meta-Llama-3.1-405B-Instruct-FP8-KV \
#            --dataset-name random \
#            --num-prompts $prompts \
#            --random-input-len 2048 \
#            --random-output-len 128 \
#            --random-range-ratio 1.0 \
#            --max-concurrency $CON \
#            --ignore-eos \
#            --port 8000 \
#            --save-result  \
#            --result-dir results/ \
#            --result-filename Meta-Llama-3.1-405B-Instruct-FP8-KV_tp8_req${prompts}_qps${qps}.json \
#            --request-rate ${qps}
#    done
#done

#echo "[INFO] req $PROMPTS inp 128 out 2048"
#for prompts in $PROMPTS; do
#    for qps in $QPS; do
#        python3 /app/vllm/benchmarks/benchmark_serving.py \
#            --backend vllm \
#            --model amd/Meta-Llama-3.1-405B-Instruct-FP8-KV \
#            --dataset-name random \
#            --num-prompts $prompts \
#            --random-input-len 128 \
#            --random-output-len 2048 \
#            --random-range-ratio 1.0 \
#            --max-concurrency $CON \
#            --ignore-eos \
#            --port 8000 \
#            --save-result  \
#            --result-dir results/ \
#            --result-filename Meta-Llama-3.1-405B-Instruct-FP8-KV_tp8_req${prompts}_qps${qps}.json \
#            --request-rate ${qps}
#    done
#done

#echo "[INFO] req $PROMPTS inp 2048 out 2048"
#for prompts in $PROMPTS; do
#    for qps in $QPS; do
#        python3 /app/vllm/benchmarks/benchmark_serving.py \
#            --backend vllm \
#            --model amd/Meta-Llama-3.1-405B-Instruct-FP8-KV \
#            --dataset-name random \
#            --num-prompts $prompts \
#            --random-input-len 2048 \
#            --random-output-len 2048 \
#            --random-range-ratio 1.0 \
#            --max-concurrency $CON \
#            --ignore-eos \
#            --port 8000 \
#            --save-result  \
#            --result-dir results/ \
#            --result-filename Meta-Llama-3.1-405B-Instruct-FP8-KV_tp8_req${prompts}_qps${qps}.json \
#            --request-rate ${qps}
#    done
#done
