from pydantic import BaseModel, EmailStr, computed_field
from fastapi import FastAPI
from typing import List, Dict, Optional, Annotated


app = FastAPI()

class Patient(BaseModel):
    
    name: str
    email: EmailStr
    age: int
    weight: float
    height: float
    married: bool
    allergies: List[str]
    contact_details: Dict[str, str]
    
    
    @computed_field
    @property
    def calculate_bmi(self) -> float:
        bmi = round(self.weight/(self.height**2),2)
        return bmi
    
    
    

def update_patient_data(patient: Patient):
    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print('BMI', patient.calculate_bmi)
    print("Updated")  
    
patient_info = {'name':'Ankur','email':'abc@hdfc.com', 'age':'65', 'weight':75.2, 'height':1.72, 'married':True, 
                'allergies':['pollen', 'dust'], 'contact_details':{'phone':'8303412345', 'emergency':'23123'}}

patient1 = Patient(**patient_info)

update_patient_data(patient1)