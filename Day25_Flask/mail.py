from flask import Flask
from flask_mail import *
import json
app = Flask(__name__)

with open("config.json", "r") as f:
    params=json.load(f)['param']

mail = Mail(app)
app.config["MAIL_SERVER"]="smtp.gmail.com"
app.config["MAIL_PORT"]=465
app.config["MAIL_USERNAME"]= params['gmail-user']
app.config["MAIL_PASSWORD"]= params['gmail-password']
app.config["MAIL_USE_TLS"]= False
app.config["MAIL_USE_SSL"]= True


@app.route("/")
def index():
    msg=Message("Important Mail",sender="ankul65@gmail.com",recipients=["srishti@gmail.com"])
    msg.body="The flask course is completed"
    mail.send(msg)
     
    return "message sent"



if __name__=="__main__":
    app.run(debug=True)