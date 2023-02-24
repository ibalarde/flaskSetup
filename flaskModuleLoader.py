#flaskModuleLoader

from flask import Flask

app = Flask(__name__)

@app.route("/")
def home_page():
    return "This is the home page"

@app.route("/module")
def module1():
    import flaskModule1
    handleData('hello world')