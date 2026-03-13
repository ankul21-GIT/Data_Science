from pydantic import BaseModel
from fastapi import FastAPI
from typing import List, Dict


app = FastAPI()

class Patient(BaseModel):
    name: str
    age: int
    weight: float
    married: bool
    allergies:  List[str]
    contact_details: Dict[str, str]
    


def insert_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print(patient.weight)
    print(patient.married)
    print(patient.allergies)
    print(patient.contact_details)
    print("Inserted")


def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print("Updated")  
    
patient_info = {'name':'Ankur','age':'30', 'weight':75.2, 'married':'True', 'allergies':['pollen','dust'],
                'contact_details':{'email':'ankul@gmail.com', 'phone':'8303412345'}}

patient1 = Patient(**patient_info)

insert_patient_data(patient1)
update_patient_data(patient1)