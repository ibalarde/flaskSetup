#flaskModuleLoader

from flask import Flask
import flaskModule1

app = Flask(__name__)

@app.route("/")
def home_page():
    return "This is the home page"

@app.route("/module")
def module1():
    print("imported flaskModule1")
    return flaskModule1.handleData('hello world')