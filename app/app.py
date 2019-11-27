#!/usr/bin/env python
import os
from flask import Flask
from flask import json, request, Response

running_mode = os.getenv('RUNNING_MODE', 'development')

app = Flask(__name__)
if running_mode == 'production':
    app.config.from_object('config.ProductionConfig')
else:
    app.config.from_object('config.DevelopmentConfig')

##
# API Endpoints and Views
##
@app.route('/', methods=['GET'])
@app.route('/ping', methods=['GET'])
def index():
    return "This is Flask API boilerplate.\n"

@app.route('/api_receiver', methods=['GET'])
def check_job():
    return


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)


