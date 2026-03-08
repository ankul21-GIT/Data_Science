# from flask import Flask,request,render_template


# app = Flask(__name__)


# @app.route("/",methods=["GET"])
# def hell():
#     return render_template("form.html")


# @app.route("/formlogin", methods=["POST"])
# def login():
#     username = request.form['uname']
#     password = request.form['pass']
#     if username == "Ankur" and password == "1234":
#         return "Welcome" + username
#     else:
#         return "Try again"

# if __name__=="__main__":
#     app.run(debug=True)

    





from flask import Flask, request

app = Flask(__name__)

@app.route("/", methods=["GET"])
def form():
    return '''
        <form action="/formlogin" method="post">
            <table>
                <tr><td>Name</td>
                    <td><input type="text" name="uname"></td></tr>
                <tr><td>Password</td>
                    <td><input type="password" name="pass"></td></tr>
                <tr><td><input type="submit"></td></tr>
            </table>
        </form>
    '''

@app.route("/formlogin", methods=["POST"])
def login():
    username = request.form['uname']
    password = request.form['pass']
    if username == "Ankur" and password == "1234":
        return "Welcome " + username
    else:
        return "Try again"

if __name__ == "__main__":
    app.run(debug=True)
    