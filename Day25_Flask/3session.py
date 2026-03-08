from flask import Flask,render_template,request,session


app = Flask(__name__)

app.secret_key="login"

@app.route("/")
def login1():
    return render_template("login.html")


@app.route("/logout")
def logout():
    session.pop("email",None)
    return render_template("login.html")
    


@app.route("/login",methods=['POST'])
def login():
    if request.method=='POST':
        username=request.form['username']
        password=request.form['password']
        if(username=="Ankur" and password=="12345"):
            session['email'] = username
            return render_template("success.html",email=username)
    else:
        msg = "Invalid username/password"
        return render_template("login.html",msg=msg)
        
@app.route("/profile")
def profile():
    if "email" in session:
        email=session['email']
        return render_template("profile.html",name=email)
    else:
        msg = "login_first"
        return render_template("login.html",msg=msg)   

if __name__=="__main__":
    app.run(debug=True)
    
