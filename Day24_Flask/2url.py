from flask import Flask,redirect,url_for

app = Flask(__name__)

@app.route("/")
def hello():
    return "Welcome to the Flask Course"

@app.route("/student")
def student():
    return "Welcome to our students"

@app.route("/faculty")
def faculty():
    return "These is my faculty member"



@app.route("/user<name>/")
def user(name):
    if name=="student":
        return redirect(url_for("student"))
    if name=="faculty":
        return redirect(url_for("faculty"))

if __name__=="__main__":
    app.run(debug=True)