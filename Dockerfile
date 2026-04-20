FROM python:3.11-slim

RUN pip install vllm runpod requests

COPY handler.py /handler.py

CMD ["python", "/handler.py"]
