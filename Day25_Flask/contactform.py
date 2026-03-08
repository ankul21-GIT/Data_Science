from flask import *
from flask_mail import *
import json
app = Flask(__name__)

with open("config.json", "r") as f:
    params=json.load(f)['param']


app.config["MAIL_SERVER"]="smtp.gmail.com"
app.config["MAIL_PORT"]=465
app.config["MAIL_USERNAME"]= params['gmail-user']
app.config["MAIL_PASSWORD"]= params['gmail-password']
app.config["MAIL_USE_TLS"]= False
app.config["MAIL_USE_SSL"]= True


mail = Mail(app)

@app.route("/")
def indexes():
    return render_template("contactform.html")



@app.route("/contact",methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        name = request.form["name"]
        email = request.form["email"]
        subj = request.form["subject"]
        mesg = request.form["message"]  
        
    msg=Message(subj,sender="email",recipients=["ankulsingh2151@gmail.com"])
    msg.body="The flask course is completed"
    mail.send(msg)
     
    return "message sent"



if __name__=="__main__":
    app.run(debug=True)