#!/bin/bash

echo "🚀 Starting Simple Test Project..."

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
echo "🌐 Opening frontend..."
cd ../frontend
python3 -m http.server 8000 &
FRONTEND_PID=$!

echo "✅ Project started!"
echo "Frontend: http://localhost:8000"
echo "Backend API: http://localhost:5000/api/emoji"
echo ""
echo "Press Ctrl+C to stop both servers"

# Wait for Ctrl+C
trap "echo 'Stopping servers...'; kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait