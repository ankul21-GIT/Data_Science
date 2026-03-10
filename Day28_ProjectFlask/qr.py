from flask import Flask,render_template,request,send_file
import qrcode



app = Flask(__name__)


@app.route("/", methods = ["GET", "POST"])
def home():
    if request.method=="POST":
        text = request.form['text']
        qrcode.make(text).save('qrcode.png')
        return send_file('qrcode.png', mimetype="image/png")
    return render_template("qr.html")



if __name__=="__main__":
    app.run(debug=True)