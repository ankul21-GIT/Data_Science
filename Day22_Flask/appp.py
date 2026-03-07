from flask import Flask,render_template,request,redirect,url_for,jsonify
from flask_sqlalchemy import SQLAlchemy  

from datetime import datetime

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///project.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)

class ToDo(db.Model):
    sno = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    desc = db.Column(db.String(500), nullable=False)
    date_created = db.Column(db.DateTime,default=datetime.utcnow)
    
    def __repr__(self) -> str:
        return f"{self.sno} - {self.title}"


@app.route('/')
def hello():
    return "Hello World"


@app.route('/product')
def product():
    return "These is our product"


@app.route('/page')
def page():
    return render_template('index.html')


if __name__=="__main__":
    app.run(debug=True)