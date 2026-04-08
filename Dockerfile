FROM nvidia/cuda:13.2.0-cudnn-runtime-ubuntu24.04
RUN apt update \
    && apt install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-full \
        python3-pip \
    && apt autoremove -y

RUN pip install marker-pdf --break-system-packages