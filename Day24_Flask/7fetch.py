from flask import Flask,render_template,request


app = Flask(__name__)


@app.route("/")
def register():
    return render_template("formfetch.html")


@app.route("/success",methods=["POST"])
def success():
    # email = request.form.get("email") ## it show only email
    result = request.form
    
    return render_template("fetch.html", result=result)


if __name__=="__main__":
    app.run(debug=True)
    

