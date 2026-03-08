from flask import Flask,render_template


app = Flask(__name__)


@app.route('/')
def vari():
    return "How is your day"

@app.route("/<uname>/")
def helloname(uname):
    return render_template("msg.html",name=uname)


@app.route("/<int:score>/")
def integer(score):
    return render_template("msg.html",name=score)


@app.route("/condition")
def condition():
    dic = {"math":"23","Python":"88","DSA":"98"}
    return render_template("cond.html",res=dic, name="Ankur")


if __name__=="__main__":
    app.run(debug=True)