from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''  # replace with correct password
app.config['MYSQL_DB'] = 'college'

mysql = MySQL(app)

@app.route('/')
def index():
    firrollno = "12"
    lasname = "Ankur"
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO Columns (rollno, name) VALUES (%s, %s)", (firrollno, lasname))
    mysql.connection.commit()
    cur.close()
    return "success"

if __name__=="__main__":
    app.run(debug=True)
