# Wyze MJPEG Proxy

A lightweight MJPEG proxy that converts RTSP streams (like Wyze cameras) into MJPEG streams that can be viewed in web browsers or integrated with other applications.

## Features

- **RTSP to MJPEG Conversion**: Converts RTSP video streams to MJPEG format
- **Web Browser Compatible**: View camera feeds directly in web browsers
- **Configurable Quality**: Adjustable resolution, quality, and frame rate
- **Lightweight**: Minimal resource usage
- **Multiple Camera Support**: Can handle multiple RTSP streams

## Configuration

After installation, you need to create a `config.yaml` file in the app's data directory with your RTSP stream settings.

### Configuration File Location

The configuration file should be placed at: `{APP_DATA_DIR}/config.yaml`

### Example Configuration

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

### Configuration Options

- **verbosity**: Log level (0-3, higher = more verbose)
- **port**: Port number for the MJPEG proxy (default: 8190)
- **streams**: Array of RTSP streams to proxy
  - **name**: Friendly name for the stream
  - **source**: RTSP URL of your camera
  - **resolution**: Output resolution (e.g., 1280x720, 1920x1080)
  - **quality**: JPEG quality (1-100, higher = better quality)
  - **framerate**: Output frame rate (1-30 fps)

## Usage

1. Install the application
2. Create/edit the `config.yaml` file in the app's data directory
3. Configure your RTSP stream URLs and settings
4. Restart the application
5. Access the MJPEG streams via the web interface

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
