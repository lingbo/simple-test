# Simple Test - Smile Emoji Web App

A simple web application that displays a smile emoji (😊) with a Python Flask backend and JavaScript frontend.

## Features

- Python Flask backend serving emoji data
- JavaScript frontend displaying the emoji
- Network access for sharing with friends on the same WiFi
- Simple and clean interface

## Project Structure

```
simple-test/
├── backend/
│   ├── app.py              # Flask backend server
│   └── requirements.txt    # Python dependencies
├── frontend/
│   └── index.html         # Frontend web page
├── start.sh              # Start locally (localhost only)
├── start-network.sh      # Start with network access
└── README.md
```

## Quick Start

### Local Access Only
```bash
./start.sh
```

### Network Access (share with friends)
```bash
./start-network.sh
```

## Access URLs

- **Frontend**: http://localhost:8000 (or your-ip:8000 for network access)
- **Backend API**: http://localhost:5001/api/emoji (or your-ip:5001 for network access)

## Requirements

- Python 3.x
- pip3

The start scripts will automatically install the required Python packages:
- Flask 2.3.3
- Flask-CORS 4.0.0

## API

### GET /api/emoji
Returns a JSON object with a smile emoji:
```json
{
  "emoji": "😊"
}
```

## Development

1. Backend runs on port 5001 (changed from 5000 due to macOS AirPlay conflict)
2. Frontend runs on port 8000
3. CORS is enabled for cross-origin requests
4. Network access binds to `0.0.0.0` for WiFi sharing

Enjoy the smile! 😊