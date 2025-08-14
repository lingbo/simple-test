import os
from flask import Flask, jsonify, send_from_directory
from flask_cors import CORS

app = Flask(__name__, static_folder='../frontend')
CORS(app)

@app.route('/')
def serve_frontend():
    return send_from_directory('../frontend', 'index.html')

@app.route('/api/emoji')
def get_emoji():
    return jsonify({'emoji': '😊'})

@app.route('/health')
def health_check():
    return jsonify({'status': 'healthy', 'emoji': '😊'})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5001))
    debug = os.environ.get('RAILWAY_ENVIRONMENT') != 'production'
    app.run(debug=debug, host='0.0.0.0', port=port)