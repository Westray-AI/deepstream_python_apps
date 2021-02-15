FROM nvcr.io/nvidia/deepstream:5.0.1-20.09-devel

RUN apt-get update
RUN apt-get install -y wget build-essential cmake

# Ubuntu Python
RUN apt-get install -y python3-pip

ENV CUDA_VER=10.2

# CUDNN comes pre-installed on deepstream container
# ENV CUDNN_VER=8.0.4.30-1+cuda${CUDA_VER}
# RUN apt-get install -y libcudnn8=${CUDNN_VER} libcudnn8-dev=${CUDNN_VER}

# Gstreamer/DeepStream setup
WORKDIR /opt/nvidia/deepstream/deepstream-5.0/lib
RUN python3 setup.py install

# OpenCV dependencies
RUN apt-get install -y libgl1-mesa-glx ffmpeg libsm6 libxext6

RUN python3 -m pip install torch torchvision

RUN python3 -m pip install jupyterlab
#     opencv \
#     scikit-image \
#     cython \
#     jupyterlab

# Jupyter lab extensions
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - && apt-get install -y nodejs