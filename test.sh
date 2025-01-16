#!/bin/bash

# Kiểm tra kiến trúc hệ thống
architecture=$(uname -m)

if [ "$architecture" == "x86_64" ] || [ "$architecture" == "amd64" ]; then
  export SELENIUM_IMAGE="selenium/standalone-chromium"
elif [ "$architecture" == "arm64" ]; then
  export SELENIUM_IMAGE="seleniarm/standalone-chromium"
elif [ "$architecture" == "armv7l" ]; then
  export SELENIUM_IMAGE="seleniarm/standalone-chromium:arm32v7"
elif [ "$architecture" == "ppc64le" ]; then
  echo "Warning: PPC64LE is not officially supported for Selenium. Exiting."
  exit 1
elif [ "$architecture" == "aarch64" ]; then
  export SELENIUM_IMAGE="seleniarm/standalone-chromium" # Tương tự ARM64
else
  echo "Unsupported architecture: $architecture"
  exit 1
fi

# Chạy docker-compose với cấu hình đã set
docker-compose up --build