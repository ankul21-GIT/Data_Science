from flask import Flask,render_template,request
import qrcode



app = Flask(__name__)


@app.route("/", methods = ["GET", "POST"])
def home():
    if request.method=="POST":
        text = request.form['text']
        qrcode.make(text).save('qrcode.png')
    return render_template("index.html")



if __name__=="__main__":
    app.run(debug=True)