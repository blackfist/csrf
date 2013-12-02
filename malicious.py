from flask import Flask, send_from_directory
mal = Flask(__name__)

@mal.route('/')
def index():
  return send_from_directory('public','sample.html')

if __name__ == "__main__":
  mal.run(debug=True,host='0.0.0.0',port=4000)