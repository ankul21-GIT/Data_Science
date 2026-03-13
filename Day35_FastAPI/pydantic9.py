from pydantic import BaseModel, EmailStr, AnyUrl, Field, field_validator
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
    
    
    @field_validator('email')
    @classmethod
    def email_validator(cls, value):
        
        valid_domain = ['hdfc.com', 'icici.com']
        ## abc@gmail.com
        domain_name = value.split('@')[-1]
        
        if domain_name not in valid_domain:
            raise ValueError('Not a valid number')
        
        return value
    
    ## patient name must be in upper case
    
    @field_validator('name')
    @ classmethod
    
    def transform_name(cls, value):
        return value.upper()
    
    
    @field_validator('age', mode='after')
    @classmethod
    def validate_age(cls, value):
        if 0 < value < 100:
            return value
        else:
            raise ValueError("Age should be in between 0 to 100")
    

def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print("Updated")  
    
patient_info = {'name':'Ankur','email':'abc@hdfc.com', 'age':'30', 'weight':75.2,
                'married':True, 'allergies':['pollen', 'dust'], 'contact_details':{'phone':'8303412345'}}

patient1 = Patient(**patient_info)

update_patient_data(patient1)