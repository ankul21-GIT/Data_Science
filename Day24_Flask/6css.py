from flask import Flask, render_template


app = Flask(__name__)


@app.route("/css")
def css():
    return render_template("css.html")


if __name__=="__main__":
    app.run(debug=True)