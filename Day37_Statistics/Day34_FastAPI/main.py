from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def hello():
    return {"Message":{"Hello World"}}


@app.get("/about")
def read():
    return {"message":"I am data Scientist"}

