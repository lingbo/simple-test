#!/bin/bash

echo "🚀 Starting Simple Test Project (Network Access)..."

# Get local IP address
LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "localhost")

# Install Python dependencies
echo "📦 Installing Python dependencies..."
cd backend
pip3 install -r requirements.txt

# Start backend in background
echo "🐍 Starting Python backend..."
python3 app.py &
BACKEND_PID=$!

# Wait a moment for backend to start
sleep 2

# Open frontend
echo "🌐 Starting frontend server..."
cd ../frontend
python3 -m http.server 8000 --bind 0.0.0.0 &
FRONTEND_PID=$!

echo "✅ Project started with network access!"
echo ""
echo "📱 Share these URLs with your mates on the same WiFi:"
echo "Frontend: http://$LOCAL_IP:8000"
echo "Backend API: http://$LOCAL_IP:5001/api/emoji"
echo ""
echo "🏠 Local access:"
echo "Frontend: http://localhost:8000"
echo "Backend API: http://localhost:5001/api/emoji"
echo ""
echo "Press Ctrl+C to stop both servers"

# Wait for Ctrl+C
trap "echo 'Stopping servers...'; kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait