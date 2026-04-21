FROM nvidia/cuda:13.2.0-cudnn-runtime-ubuntu24.04
RUN apt update \
    && apt install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-full \
        python3-pip \
    && apt autoremove -y

RUN pip install marker-pdf psutil --break-system-packages

COPY llncsdoc.pdf /app/llncsdoc.pdf
WORKDIR /app
RUN marker_single /app/llncsdoc.pdf --output_dir .

# NUM_DEVICES=2 NUM_WORKERS=2 marker_chunk_convert ./papers/ ./output/