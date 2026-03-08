from flask import *


app = Flask(__name__)

app.secret_key = 'login form'

@app.route('/')
def sss():
    return render_template('form.html')

@app.route('/formlogin', methods=['GET'])
def login():
    error = None
    uname = request.args.get('uname')
    password = request.args.get('pass')
    if uname == "sheetal" and password == "123":
        return render_template('message.html', name=uname)
    else:
        error = "Invalid username or password"
        return render_template("form.html",error=error)
        # return "try "


if __name__=="__main__":
    app.run(debug=True)
    
    
    
