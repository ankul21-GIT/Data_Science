from flask import Flask,request


app = Flask(__name__)



@app.route("/")
def hell():
    return "hello sir"

@app.route("/success",methods=["POST"])
def success():
    if request.method == 'POST':
        f=request.files['file']
        f.save(f.filename)
        return "success"
    
if __name__=="__main__":
    app.run(debug=True)
    
    

# from flask import Flask, request

# app = Flask(__name__)

# @app.route("/")
# def index():
#     return '''
#         <form action="/success" method="POST" enctype="multipart/form-data">
#             <input type="file" name="file" />
#             <input type="submit"/>
#         </form>
#     '''

# @app.route("/success", methods=["POST"])
# def success():
#     if request.method == 'POST':
#         f = request.files['file']
#         f.save(f.filename)  # saves in same folder as app
#         return "File uploaded successfully!"

# if __name__ == "__main__":
#     app.run(debug=True)
