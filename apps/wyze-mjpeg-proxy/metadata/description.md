# Wyze MJPEG Proxy

A lightweight MJPEG proxy that converts RTSP streams (like Wyze cameras) into MJPEG streams that can be viewed in web browsers or integrated with other applications.

## Features

- **RTSP to MJPEG Conversion**: Converts RTSP video streams to MJPEG format
- **Web Browser Compatible**: View camera feeds directly in web browsers
- **Configurable Quality**: Adjustable resolution, quality, and frame rate
- **Lightweight**: Minimal resource usage
- **Multiple Camera Support**: Can handle multiple RTSP streams

## Configuration

### Required Settings

- **RTSP Stream URL**: The RTSP URL of your camera or video source
  - Format: `rtsp://username:password@ip:port/path`
  - Example: `rtsp://root:123456@192.168.1.201:554/ch0_0.h264`

### Optional Settings

- **Resolution**: Output resolution (640x480, 1280x720, 1920x1080)
- **JPEG Quality**: Image quality from 1-100 (higher = better quality)
- **Frame Rate**: Output frames per second (1-30)

## Usage

1. Configure the RTSP URL of your camera
2. Adjust quality and frame rate settings as needed
3. Access the MJPEG stream via the web interface
4. Use the stream URL in other applications or web pages

## Supported Cameras

- Wyze cameras (with custom firmware)
- Any RTSP-compatible IP camera
- Security cameras with RTSP support
- Network video recorders (NVR)

## Use Cases

- **Home Security**: Monitor cameras in web browsers
- **Integration**: Embed camera feeds in web applications
- **Remote Viewing**: Access camera streams from anywhere
- **Multiple Displays**: View HDMI streams in multiple locations

## Technical Details

- **Input**: RTSP video streams
- **Output**: MJPEG streams over HTTP
- **Port**: 8190 (configurable)
- **Protocol**: HTTP/HTTPS
- **Format**: MJPEG video stream
