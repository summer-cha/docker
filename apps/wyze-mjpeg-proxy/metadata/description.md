# Wyze MJPEG Proxy

一个轻量级的 MJPEG 代理服务，可以将 RTSP 视频流（如 Wyze 摄像头）转换为 MJPEG 流，以便在网页浏览器中查看。

## 功能特点

- **RTSP 转 MJPEG**：将 RTSP 视频流转换为 MJPEG 格式
- **浏览器兼容**：直接在网页浏览器中查看摄像头画面
- **可配置参数**：支持调整分辨率、质量和帧率
- **轻量级**：占用资源少
- **多摄像头支持**：可以同时处理多个 RTSP 流

## 配置说明

安装后，你需要在应用数据目录中创建或修改 `config.yaml` 配置文件。

### 配置文件位置

配置文件路径：`{APP_DATA_DIR}/data/config.yaml`

### 配置示例

```yaml
verbosity: 0
port: 8190
streams:
  - name: printer-cam
    source: rtsp://root:123456@192.168.1.201:554/ch0_0.h264
    resolution: 1280x720
    quality: 60
    framerate: 3
  
  # 添加更多摄像头
  - name: front-door
    source: rtsp://admin:password@192.168.1.202:554/stream1
    resolution: 1920x1080
    quality: 80
    framerate: 5
```

### 配置参数

**全局参数：**
- **verbosity**: 日志详细程度 (0-3，数字越大越详细)
- **port**: 服务端口 (默认: 8190)

**视频流参数：**
- **name**: 流的名称（用于访问 URL）
- **source**: RTSP 源地址 (格式: rtsp://用户名:密码@IP:端口/路径)
- **resolution**: 输出分辨率 (如: 1280x720, 1920x1080)
- **quality**: JPEG 质量 (1-100，推荐 60-80)
- **framerate**: 帧率 (1-30 fps，推荐 3-5 fps)

## 使用方法

1. 在 Runtipi 中安装此应用
2. 进入应用数据目录：`app-data/wyze-mjpeg-proxy/data/`
3. 编辑 `config.yaml` 文件，配置你的 RTSP 摄像头地址
4. 保存后重启应用
5. 访问视频流：`http://你的服务器:8190/stream/流名称`

### 访问视频流

- **Web 界面**: `http://你的服务器:8190/`
- **单个视频流**: `http://你的服务器:8190/stream/printer-cam`
- **在网页中嵌入**: 
  ```html
  <img src="http://你的服务器:8190/stream/printer-cam" alt="摄像头">
  ```

## 支持的摄像头

- Wyze 摄像头（需要自定义固件）
- 任何支持 RTSP 的 IP 摄像头
- 支持 RTSP 的安防摄像头
- 网络录像机 (NVR)

## 常见 RTSP 地址格式

### 海康威视
```
rtsp://admin:password@192.168.1.x:554/h264/ch0/main/av_stream
```

### 大华摄像头
```
rtsp://admin:password@192.168.1.x:554/cam/realmonitor?channel=1&subtype=0
```

### TP-Link/Tapo
```
rtsp://username:password@192.168.1.x:554/stream1
```

## 性能优化建议

**低带宽环境：**
- 分辨率：640x480
- 质量：40-50
- 帧率：2-3 fps

**平衡设置（推荐）：**
- 分辨率：1280x720
- 质量：60-70
- 帧率：3-5 fps

**高质量：**
- 分辨率：1920x1080
- 质量：80-90
- 帧率：5-10 fps

## 故障排除

### 无法连接摄像头
1. 检查 RTSP 地址是否正确
2. 确认摄像头 IP 和端口可访问
3. 验证用户名和密码是否正确
4. 检查网络防火墙设置

### 视频卡顿
1. 降低分辨率
2. 降低帧率
3. 降低质量参数
4. 检查网络带宽

### 配置不生效
1. 确保 YAML 格式正确（注意缩进）
2. 保存后需要重启应用
3. 检查日志查看错误信息

## 技术细节

- **输入**: RTSP 视频流
- **输出**: HTTP MJPEG 流
- **端口**: 8190 (可配置)
- **协议**: HTTP
- **格式**: MJPEG

## 使用场景

- **家庭监控**: 在浏览器中监控摄像头
- **集成应用**: 将摄像头画面嵌入网页应用
- **远程查看**: 从任何地方访问摄像头流
- **多屏显示**: 在多个位置显示摄像头画面
