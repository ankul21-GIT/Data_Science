from flask import Flask


app = Flask(__name__)


@app.route("/", methods=["GET"])
def hellow():
    return "These is my first program in flask"



@app.route("/form")
def form():
    return "Fill the name and address in these form"


@app.route("/<name>/")
def names(name):
    return "My name is : " + name


@app.route("/<int:date>/")
def date(date):
    return "Date = "+ str(date)


if __name__=="__main__":  
    app.run(debug=True)