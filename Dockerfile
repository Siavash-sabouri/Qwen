FROM vllm/vllm-openai:latest

RUN pip install runpod requests

COPY handler.py /handler.py

CMD python /handler.py
