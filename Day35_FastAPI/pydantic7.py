from pydantic import BaseModel, EmailStr, AnyUrl, Field
from fastapi import FastAPI
from typing import List, Dict, Optional, Annotated


app = FastAPI()

class Patient(BaseModel):
    
    name: Annotated[str, Field(max_length=50, title='Name of patient', description='Give the name of the patient in less than 50 char',
    examples=['Ankur','Amit'])]
    email: EmailStr
    linkedin_url: AnyUrl
    age: int = Field(gt=0, lt=120) ## we will define the range greater than zero and less than 120.
    weight: float = Field(gt=0) ### input shoul be greater than zero.
    married: Annotated[bool, Field(default=None, description='is the patient married or not')]
    allergies: Annotated[Optional[List[str]],  Field(default=None, max_length=5)]
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
    
patient_info = {'name':'Ankur','email':'abc@gmail.com', 'linkedin_url':'http://linkedin.com/1323' ,'age':'30', 'weight':75.2,
                'contact_details':{'phone':'8303412345'}}

patient1 = Patient(**patient_info)

insert_patient_data(patient1)
update_patient_data(patient1)