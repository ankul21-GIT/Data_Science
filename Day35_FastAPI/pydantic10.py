from pydantic import BaseModel, EmailStr, model_validator
from fastapi import FastAPI
from typing import List, Dict, Optional, Annotated


app = FastAPI()

class Patient(BaseModel):
    
    name: str
    email: EmailStr
    age: int
    weight: float
    married: bool
    allergies: List[str]
    contact_details: Dict[str, str]
    
    
    ## for checking those whose age is greater than 60 and he/she have emergency number or not
    
    @model_validator(mode='after')
    
    def validate_emergency_contact(cls, model):
        
        if model.age> 60 and 'emergency' not in model.contact_details:
            raise ValueError("Patients older than 60 must have an emergency contact")
        return model

def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print("Updated")  
    
patient_info = {'name':'Ankur','email':'abc@hdfc.com', 'age':'65', 'weight':75.2,'married':True, 
                'allergies':['pollen', 'dust'], 'contact_details':{'phone':'8303412345', 'emergency':'23123'}}

patient1 = Patient(**patient_info)

update_patient_data(patient1)