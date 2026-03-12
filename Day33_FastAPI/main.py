from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()



## Below code are define data structure
class Tea(BaseModel):
    id : int
    name : str
    origin : str
    
teas: list[Tea] = []


@app.get("/")
def read_root():
    return {"message":"Welcome to the class of FastAPI"}


@app.get("/teas")
def add_tea():
    return teas


@app.post("/teas")
def add_tea(tea: Tea):
    teas.append(tea)
    
    
@app.put("/teas/{tea_id}")
def update_tea(tea_id: int, updated_tea : Tea):
    for index, tea in enumerate(teas):
        if tea.id == tea_id:
            teas[index] = update_tea
            return update_tea
    return {"error":"tea not found"}


@app.delete("/teas/{tea_id}")
def delete_tea(tea_id: int):
    for index, tea in enumerate(teas):
        if tea.id == tea_id:
            deleted = teas.pop(index)
            return deleted
    return {"error":"tea not found"}
