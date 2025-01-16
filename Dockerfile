FROM ubuntu:24.04

# Cập nhật hệ thống và cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    wget \
    build-essential \
    python3-pip \
    && apt-get clean

# Thêm repository Deadsnakes để cài đặt các phiên bản Python mới hơn
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

# Cài đặt các phiên bản Python 3.8, 3.9, 3.10 và cài đặt distutils
RUN apt-get install -y \
    python3.8 python3.8-distutils \
    python3.9 python3.9-distutils \
    python3.10 python3.10-distutils \
    python3.11 python3.11-distutils

# Đặt Python 3.12 làm mặc định (tùy chỉnh theo nhu cầu của bạn)
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Sao chép file hellowork.py từ máy tính vào container
COPY hellowork.py /hellowork.py

# Cài đặt pip cho tất cả các phiên bản Python
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
#     && python3.8 get-pip.py \
#     && python3.9 get-pip.py \
#     && python3.10 get-pip.py \
#     && python3.11 get-pip.py \
#     && python3.12 get-pip.py \
#     && rm get-pip.py

# Kiểm tra cài đặt các phiên bản Python
RUN python3.8 --version && python3.9 --version && python3.10 --version && python3.11 --version && python3 --version

# Lệnh mặc định khi container khởi động
CMD python3.8 /hellowork.py && \
    python3.9 /hellowork.py && \
    python3.10 /hellowork.py && \
    python3.11 /hellowork.py && \
    python3 /hellowork.py
