import runpod
import requests
import time
import subprocess
import os

def handler(job):
    job_input = job["input"]
    response = requests.post(
        "http://localhost:8000/v1/chat/completions",
        json=job_input
    )
    return response.json()

def start_vllm():
    subprocess.Popen([
        "python", "-m", "vllm.entrypoints.openai.api_server",
        "--model", "/workspace/qwen3-coder",
        "--enable-lora",
        "--lora-modules", "lora=/workspace/qwen3-coder-lora",
        "--max-lora-rank", "16",
        "--max-model-len", "32768",
        "--port", "8000"
    ])
    time.sleep(30)

start_vllm()
runpod.serverless.start({"handler": handler})
