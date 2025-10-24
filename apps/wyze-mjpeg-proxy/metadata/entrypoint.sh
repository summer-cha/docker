#!/bin/sh
set -e

# 生成 config.yaml 文件
cat > /config.yaml << EOF
verbosity: 0
port: 8190
streams:
  - name: ${CAMERA_NAME:-printer-cam}
    source: ${RTSP_SOURCE:-rtsp://root:123456@192.168.1.201:554/ch0_0.h264}
    resolution: ${RESOLUTION:-1280x720}
    quality: ${QUALITY:-60}
    framerate: ${FRAMERATE:-3}
EOF

echo "Generated config.yaml:"
cat /config.yaml

# 启动 wyze-mjpeg-proxy
exec /wyze-mjpeg-proxy

