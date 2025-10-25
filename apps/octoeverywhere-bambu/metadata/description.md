# OctoEverywhere Bambu Connect

通过互联网从任何地方远程访问和控制你的 Bambu Lab 3D 打印机（LAN模式）。

## 功能特点

-  **远程访问** - 无需端口转发或复杂配置
-  **实时监控** - 查看打印进度和摄像头画面
-  **智能通知** - 打印完成或出现问题时收到通知
-  **完全控制** - 远程控制打印机的所有功能

## 支持的功能

✅ 裹头检测
✅ 错层检测
✅ 炒面检测
✅ 脱落检测


## 快速开始

### 1. 获取 Access Code（访问码）

访问 [https://octoeverywhere.com/s/access-code](https://octoeverywhere.com/s/access-code) 注册账号并获取你的访问码。

### 2. 获取打印机信息

- **序列号**: 访问 [https://octoeverywhere.com/s/bambu-sn](https://octoeverywhere.com/s/bambu-sn) 了解如何获取
  - 或在拓竹打印机屏幕上: 设置 → 设备 → 序列号
- **打印机 IP**: 在打印机屏幕上查看: 设置 → 网络 → IP 地址
  - 或在路由器管理页面查找 Bambu Lab 设备

### 3. 安装配置

在安装界面填写以下信息：

| 字段 | 说明 | 示例 |
|------|------|------|
| Access Code | OctoEverywhere 访问码 | `ABCD-1234-EFGH-5678` |
| Serial Number | 打印机序列号 | `01S00C123456789` |
| Printer IP | 打印机局域网 IP | `192.168.1.100` |

### 4. 启动使用

安装完成后，前往 [https://octoeverywhere.com](https://octoeverywhere.com) 登录你的账号即可远程访问打印机。



## 常见问题

**Q: Access Code 在哪里获取？**

A: 访问 [octoeverywhere.com/s/access-code](https://octoeverywhere.com/s/access-code) 注册并获取。免费账号即可使用基本功能。


## 技术参数

| 参数 | 值 |
|------|-----|
| 推荐内存 | 512MB+ |
| 推荐 CPU | 1 核+ |
| 支持架构 | amd64, arm64 |
| 网络要求 | 与打印机同一局域网 |

## 隐私与安全

- 所有连接通过加密隧道传输
- 数据不经过第三方服务器（点对点连接）
- 可随时断开远程访问
- 开源项目，代码可审计

## 相关链接

- [官方网站](https://octoeverywhere.com/)
- [GitHub 仓库](https://github.com/QuinnDamerell/OctoEverywhere)
- [使用文档](https://octoeverywhere.com/docs)
- [获取 Access Code](https://octoeverywhere.com/s/access-code)
- [Bambu Lab 设置指南](https://octoeverywhere.com/s/bambu-sn)

## 注意事项

  **重要**: 
- 确保打印机固件是最新版本
- 建议为打印机设置静态 IP
- 首次连接可能需要几分钟来建立安全隧道
- 远程访问时注意网络延迟



