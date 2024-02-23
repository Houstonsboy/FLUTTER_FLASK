from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # This will enable CORS for all routes

@app.route("/")
def login():
    artists = [
        {'id': '5', 'name': 'TheWeeknd', 'genre': 'pop'},
        {'id': '3', 'name': 'Chris Brown', 'genre': 'rnb'}
    ]
    return jsonify(artists)

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)