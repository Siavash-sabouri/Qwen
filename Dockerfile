FROM vllm/vllm-openai:latest

RUN pip install runpod requests

COPY handler.py /handler.py

CMD python -m vllm.entrypoints.openai.api_server \
    --model /runpod-volume/qwen3-coder \
    --enable-lora \
    --lora-modules lora=/runpod-volume/qwen3-coder-lora \
    --max-lora-rank 16 \
    --max-model-len 32768 \
    --port 8000 & \
    sleep 30 && python /handler.py
