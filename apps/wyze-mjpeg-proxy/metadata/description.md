# Wyze MJPEG Proxy

将 RTSP 视频流转换为 MJPEG 格式，可直接在浏览器中查看摄像头画面。

## 功能特点

- RTSP 转 MJPEG 转换
- 支持多摄像头同时转换
- 可调节分辨率、质量、帧率
- 轻量级，资源占用少

## 快速开始

### 单摄像头配置（推荐新手）

安装时在界面填写配置参数：
- **摄像头名称**: 如 `printer-cam`
- **RTSP 地址**: `rtsp://用户名:密码@IP:端口/路径`
- **分辨率**: `1280x720` 或 `1920x1080`
- **质量**: 1-100，推荐 60-80
- **帧率**: 1-30，推荐 3-5

访问地址：`http://服务器IP:8190/摄像头名称/stream.mjpg`

---

## 多摄像头配置（高级）

### 方案1：多实例部署
为每个摄像头单独安装一个应用实例，每个占用不同端口：
- 打印机摄像头: 端口 8190
- 门口摄像头: 端口 8191
- 车库摄像头: 端口 8192

### 方案2：User Config 配置（推荐）✅ 已测试

#### 操作步骤

1. 先按单摄像头方式安装应用
2. 安装完成后，进入应用详情页
3. 点击 **"User config"** 标签
4. 启用 **"Enable user config"** 开关
5. 选择 **"docker-compose.yml"** 标签
6. 粘贴下面对应的配置
7. 点击 **"Save"** 保存
8. 停止应用，然后重新启动使配置生效

---

#### 配置A：单摄像头（测试通过 ✅）

```yaml
services:
  config-generator:
    command:
      - sh
      - -c
      - |
        cat > /shared/config.yaml << 'EOF'
        verbosity: 0
        port: 8190
        streams:
          - name: printer-cam
            source: rtsp://admin:password@192.168.1.16:554/h264/ch0/main/av_stream
            resolution: 1280x720
            quality: 60
            framerate: 3
        EOF
        cat /shared/config.yaml
        sleep infinity
```

**访问地址：**
- 视频流: `http://服务器IP:8190/printer-cam/stream.mjpg`
- 首页: `http://服务器IP:8190/`

**参数说明：**
- `name`: 摄像头名称（用于 URL）
- `source`: 替换为你的 RTSP 地址
- `resolution`: 分辨率（如 640x480, 1280x720, 1920x1080）
- `quality`: JPEG 质量 1-100
- `framerate`: 帧率 1-30

---

#### 配置B：双摄像头（测试通过 ✅）

```yaml
services:
  config-generator:
    command:
      - sh
      - -c
      - |
        cat > /shared/config.yaml << 'EOF'
        verbosity: 0
        port: 8190
        streams:
          - name: printer-cam
            source: rtsp://admin:password@192.168.1.16:554/h264/ch0/main/av_stream
            resolution: 1280x720
            quality: 60
            framerate: 3
          - name: door-cam
            source: rtsp://admin:password@192.168.1.17:554/stream
            resolution: 1920x1080
            quality: 80
            framerate: 5
        EOF
        cat /shared/config.yaml
        sleep infinity
```

**访问地址：**
- 打印机摄像头: `http://服务器IP:8190/printer-cam/stream.mjpg`
- 门口摄像头: `http://服务器IP:8190/door-cam/stream.mjpg`
- 首页列表: `http://服务器IP:8190/`

---

#### 配置C：三摄像头或更多

```yaml
services:
  config-generator:
    command:
      - sh
      - -c
      - |
        cat > /shared/config.yaml << 'EOF'
        verbosity: 0
        port: 8190
        streams:
          - name: printer-cam
            source: rtsp://admin:password@192.168.1.16:554/stream
            resolution: 1280x720
            quality: 60
            framerate: 3
          - name: door-cam
            source: rtsp://admin:password@192.168.1.17:554/stream
            resolution: 1920x1080
            quality: 80
            framerate: 5
          - name: garage-cam
            source: rtsp://admin:password@192.168.1.18:554/stream
            resolution: 1280x720
            quality: 70
            framerate: 4
        EOF
        cat /shared/config.yaml
        sleep infinity
```

**访问地址：**
- 打印机: `http://服务器IP:8190/printer-cam/stream.mjpg`
- 门口: `http://服务器IP:8190/door-cam/stream.mjpg`
- 车库: `http://服务器IP:8190/garage-cam/stream.mjpg`

**添加更多摄像头：** 只需在 `streams:` 下继续添加 `- name:` 块即可！

---

## 修改配置

### 修改单摄像头配置
1. 进入应用设置标签
2. 修改参数
3. 保存并重启应用

### 修改多摄像头配置
1. 进入 User config 标签
2. 编辑 docker-compose.yml 中的 streams 部分
3. 添加/删除/修改摄像头配置
4. 保存并重启应用

---

## 使用场景

### 浏览器直接查看
在浏览器中访问 `http://服务器IP:8190/` 查看所有摄像头列表

### 嵌入网页
```html
<img src="http://服务器IP:8190/printer-cam/stream.mjpg" alt="打印机摄像头">
```

### Home Assistant 集成
```yaml
camera:
  - platform: mjpeg
    name: 打印机摄像头
    mjpeg_url: http://服务器IP:8190/printer-cam/stream.mjpg
```

---

## 注意事项

⚠️ **User Config 警告**：编辑 User Config 时请小心，配置错误可能导致应用无法启动。建议先备份配置。

💡 **性能提示**：
- 多摄像头会增加 CPU 占用
- 降低帧率和质量可减少资源消耗
- 建议同时转换不超过 5 个摄像头

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
