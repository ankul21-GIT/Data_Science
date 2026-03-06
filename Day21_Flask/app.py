from flask import Flask,render_template,request,redirect,url_for,jsonify
from sqlalchemy import SQLAlchemy
from datetime import datetime

now = datetime.now()
print("Current date and time:", now)


# create a simple flask application

app = Flask(__name__)


# Flask app routing

@app.route("/",methods=["GET"])
def welcome():
    return "<h1>Future Data Science engineer</h1>"

@app.route("/index",methods=["GET"])
def index():
    return "<h2>Future GenAI and agenticAI engineer</h2>"




## Variable Rule

# @app.route('/success/<score>')
# def success(score):
#     return "The person has passed and the score is : "+ score



@app.route('/success/<int:score>')
def success(score):
    return "The person has passed the exam and the score is : "+ str(score)

@app.route('/fail/<int:score>')
def fail(score):
    return "The person has failed the exam and the score is : "+ str(score)


@app.route('/form',methods=["GET","POST"])
def form():
    if request.method=="GET":
        return render_template('form.html')
    else:
        maths=float(request.form["maths"])
        science=float(request.form["science"])
        history=float(request.form["history"])
        
        avg_mark = (maths+science+history)/3
        
        res=" "
        if avg_mark>=50:
            res="success"
        else:
            res="fail"
        
        return redirect(url_for(res,score=avg_mark))
        # return render_template("form.html",score=avg_mark)

## API
@app.route('/api', methods=['POST'])
def calculate_sum():
    data=request.get_json()
    a_val = float(data['a'])
    b_val = float(data['b'])
    result = a_val + b_val
    return jsonify({'sum': result})



if __name__=="__main__":
    app.run(debug=True)