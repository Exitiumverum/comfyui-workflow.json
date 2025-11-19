# clean base image containing only comfyui, comfy-cli and comfyui-manager

FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui

RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511111955

RUN comfy node install --exit-on-fail comfyui_ttp_toolset@1.0.5

RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.4

RUN comfy node install --exit-on-fail comfyui-florence2@1.0.6

RUN comfy node install --exit-on-fail comfyui-supir@1.0.2

RUN comfy node install --exit-on-fail cg-use-everywhere@7.5.1

RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0

RUN comfy node install --exit-on-fail comfyui_layerstyle@1.0.90

RUN comfy node install --exit-on-fail comfyui-custom-scripts@1.2.5

# download models into comfyui

RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors --relative-path models/vae --filename ae.safetensors

RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors

RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/clip --filename t5xxl_fp8_e4m3fn.safetensors

RUN comfy model download --url https://huggingface.co/Phips/4xFFHQDAT/blob/f73a004690ab04143c5e7ec8b7491d70124432c8/4xFFHQDAT.safetensors --relative-path models/upscale_models --filename 4xFFHQDAT.safetensors

# Added models
RUN comfy model download --url https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/1x-ITF-SkinDiffDetail-Lite-v1.pth --relative-path models/upscale_models --filename 1x-ITF-SkinDiffDetail-Lite-v1.pth

RUN comfy model download --url https://huggingface.co/camenduru/FLUX.1-dev/resolve/fc63f3204a12362f98c04bc4c981a06eb9123eee/FLUX.1-Turbo-Alpha.safetensors --relative-path models/checkpoints --filename flux1-turbo-alpha-8steps.safetensors

RUN comfy model download --url https://huggingface.co/RunDiffusion/Juggernaut-XL-Lightning/resolve/main/Juggernaut_RunDiffusionPhoto2_Lightning_4Steps.safetensors --relative-path models/checkpoints --filename juggernaut_xl_lightning_by_rd.safetensors

RUN comfy model download --url https://huggingface.co/camenduru/SUPIR/resolve/main/SUPIR-v0F.ckpt --relative-path models/checkpoints --filename SUPIR-v0F.ckpt

RUN comfy model download --url https://huggingface.co/wikeeyang/SRPO-Refine-Quantized-v1.0/blob/main/Flux1-Dev-SRPO-v1-fp8.safetensors --relative-path models/diffusion_models --filename Flux1-Dev-SRPO-v1-fp8.safetensors

RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)

# COPY input/ /comfyui/input/

