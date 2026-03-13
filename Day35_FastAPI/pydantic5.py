from pydantic import BaseModel, EmailStr
from fastapi import FastAPI
from typing import List, Dict, Optional


app = FastAPI()

class Patient(BaseModel):
    name: str
    email: EmailStr
    age: int
    weight: float
    married: bool = False
    allergies: Optional[List[str]] = None
    contact_details: Dict[str, str]
    


def insert_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print("Inserted")


def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print("Updated")  
    
patient_info = {'name':'Ankur','email':'abc@gmail.com', 'age':'30', 'weight':75.2,
                'contact_details':{'phone':'8303412345'}}

patient1 = Patient(**patient_info)

insert_patient_data(patient1)
update_patient_data(patient1)