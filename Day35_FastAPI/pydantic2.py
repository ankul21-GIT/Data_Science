from pydantic import BaseModel
from fastapi import FastAPI

app = FastAPI()

class Patient(BaseModel):
    name: str
    age: int
    


def insert_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print("Inserted")


def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print("Updated")  
    
patient_info = {'name':'Ankur','age':30}

patient1 = Patient(**patient_info)

insert_patient_data(patient1)
update_patient_data(patient1)