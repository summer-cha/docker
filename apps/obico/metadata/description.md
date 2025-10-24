# Obico ML API

AI 驱动的 3D 打印故障检测 API 服务，提供实时打印故障检测能力。

## 功能特点

- 🤖 AI 故障检测 - 实时监控 3D 打印过程
- 🔌 REST API 接口 - 简单易用的 HTTP API
- 🎯 高精度检测 - 基于深度学习模型
- 🚀 轻量级部署 - 独立 ML API 服务

## 快速开始

安装完成后，ML API 将在端口 **3333** 上运行。

### API 访问地址

```
http://服务器IP:3333
```

## API 使用

### 检测图片

发送 POST 请求到 API 进行故障检测：

```bash
curl -X POST http://服务器IP:3333/p/ \
  -F "img=@printer_image.jpg"
```

### 响应示例

```json
{
  "detections": [
    {
      "label": "failure",
      "score": 0.95,
      "bbox": [100, 150, 200, 250]
    }
  ]
}
```

## 使用场景

### 1. OctoPrint/Klipper 集成
将 Obico ML API 集成到你的 3D 打印机控制软件中，实现自动故障检测。

### 2. 自定义监控系统
通过 API 调用，构建自己的打印监控和报警系统。

### 3. 批量打印管理
管理多台打印机，统一进行故障检测和监控。

## API 端点

| 端点 | 方法 | 说明 |
|------|------|------|
| `/p/` | POST | 上传图片进行故障检测 |
| `/health/` | GET | 健康检查 |

## 配置说明

### API 监听地址
- 默认: `0.0.0.0` （监听所有网络接口）
- 用途: 控制 API 服务的访问范围

### API 端口
- 默认: `3333`
- 用途: ML API 服务监听端口

## 性能建议

### CPU 模式（默认）
- 适用于大多数场景
- 检测速度: 2-5 秒/图片
- 内存占用: ~2GB

### GPU 加速（可选）
如需 GPU 加速，需要在 **User Config** 中添加：

```yaml
services:
  obico-ml-api:
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

## 注意事项

⚠️ **独立服务**: 这是独立的 ML API 服务，如需完整的 Obico Server（包括 Web 界面、用户管理等），请参考官方文档自行部署。

💡 **资源占用**: ML 模型会占用较多内存，建议服务器至少有 4GB 可用内存。

🔒 **网络安全**: 建议在生产环境中配置反向代理和访问控制。

## 常见问题

**Q: 如何测试 API 是否正常运行？**

A: 访问健康检查端点：
```bash
curl http://服务器IP:3333/health/
```

**Q: 支持哪些图片格式？**

A: 支持 JPG、PNG 等常见图片格式。

**Q: 检测速度慢怎么办？**

A: 
1. 考虑使用 GPU 加速
2. 降低图片分辨率（推荐 640x480）
3. 增加服务器 CPU/内存配置

## 技术参数

| 参数 | 值 |
|------|-----|
| 推荐内存 | 4GB+ |
| 推荐 CPU | 2 核+ |
| 支持架构 | amd64, arm64 |
| 默认端口 | 3333 |

## 相关链接

- [Obico 官网](https://www.obico.io/)
- [GitHub 仓库](https://github.com/TheSpaghettiDetective/obico-server)
- [API 文档](https://www.obico.io/docs/)
