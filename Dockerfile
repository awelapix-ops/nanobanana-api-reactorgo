# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.25.1
RUN comfy node install --exit-on-fail ComfyUI-Save-Image-Callback
RUN comfy node install --exit-on-fail comfyui-kimara-ai-advanced-watermarks@1.0.0
RUN comfy node install --exit-on-fail comfyui-impact-subpack@1.3.5
RUN comfy node install --exit-on-fail d2-nodes-comfyui@27.8.0

# download models into comfyui
RUN comfy model download --url https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth --relative-path models/upscale_models --filename RealESRGAN_x2.pth
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8n_v2.pt --relative-path models/checkpoints --filename face_yolov8n_v2.pt
RUN comfy model download --url https://github.com/facefusion/facefusion-assets/releases/download/models/inswapper_128.onnx --relative-path models/checkpoints --filename inswapper_128.onnx
RUN comfy model download --url https://huggingface.co/datasets/Gourieff/ReActor/resolve/main/models/facerestore_models/GPEN-BFR-512.onnx?download=true --relative-path models/checkpoints --filename GPEN-BFR-512.onnx

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
