# Wyze MJPEG Proxy

将 RTSP 视频流转换为 MJPEG 格式，可直接在浏览器中查看摄像头画面。

## 功能特点

- RTSP 转 MJPEG 转换
- 支持多摄像头
- 可调节分辨率、质量、帧率
- 轻量级，资源占用少

## 配置说明

安装后需要编辑配置文件。

### 配置文件位置

应用安装后会自动创建配置模板：
```
{APP_DATA_DIR}/data/config.yaml
```

### 编辑配置

通过 Runtipi 文件管理或 SSH 编辑配置文件：

### 配置示例

**单摄像头：**
```yaml
verbosity: 0
port: 8190
streams:
  - name: printer-cam
    source: rtsp://root:123456@192.168.1.201:554/ch0_0.h264
    resolution: 1280x720
    quality: 60
    framerate: 3
```

**多摄像头：**
```yaml
verbosity: 0
port: 8190
streams:
  - name: printer-cam
    source: rtsp://root:123456@192.168.1.201:554/ch0_0.h264
    resolution: 1280x720
    quality: 60
    framerate: 3
  - name: front-door
    source: rtsp://admin:password@192.168.1.202:554/stream1
    resolution: 1920x1080
    quality: 80
    framerate: 5
```

### 参数说明

| 参数 | 说明 | 示例 |
|------|------|------|
| verbosity | 日志级别 (0-3) | 0 |
| port | 服务端口 | 8190 |
| name | 流名称 | printer-cam |
| source | RTSP 地址 | rtsp://user:pass@192.168.1.x:554/path |
| resolution | 分辨率 | 1280x720 |
| quality | 质量 (1-100) | 60 |
| framerate | 帧率 (1-30) | 3 |

## 使用步骤

1. 安装应用
2. 编辑 `{APP_DATA_DIR}/data/config.yaml` 配置文件
3. 修改 RTSP 地址、用户名、密码
4. 重启应用
5. 访问：`http://你的服务器:8190/`

## 访问视频流

- Web 界面: `http://服务器IP:8190/`
- 单个视频流: `http://服务器IP:8190/stream/流名称`

## 常见摄像头 RTSP 地址

**海康威视:**
```
rtsp://admin:password@192.168.1.x:554/h264/ch0/main/av_stream
```

**大华:**
```
rtsp://admin:password@192.168.1.x:554/cam/realmonitor?channel=1&subtype=0
```

**TP-Link/Tapo:**
```
rtsp://username:password@192.168.1.x:554/stream1
```

## 性能建议

| 场景 | 分辨率 | 质量 | 帧率 |
|------|--------|------|------|
| 低带宽 | 640x480 | 40-50 | 2-3 |
| 平衡（推荐） | 1280x720 | 60-70 | 3-5 |
| 高质量 | 1920x1080 | 80-90 | 5-10 |
