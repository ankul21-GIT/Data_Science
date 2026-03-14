from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def home():
    return {"message":"Hello World", "Home":'This is home page'}


@app.post('/')
def hello():
    return {'message':'Hi World'}


@app.put('/')
def home():
    return {'message':'This is not for request'}
