from pydantic import BaseModel
from fastapi import FastAPI

app = FastAPI()

class Address(BaseModel):
    
    city: str
    state: str
    pin: str
    
class Patient(BaseModel):
    
    name: str
    gender: str
    age: int
    # address: 'house no. 2, sec 66, gurugram, haryana, 221303'
    address: Address
    
address_dict = {'city':'Gurgaon', 'state':'Haryana', 'pin':'212341'}

address1 = Address(**address_dict)

Patient_dict = {'name':'Ankur', 'gender':'Male', 'age':35, 'address':address1}

patient1 = Patient(**Patient_dict)

print(patient1)

print(patient1.name)
print(patient1.address.city)
print(patient1.address.pin)

print()
## check the dictionary typt
temp = patient1.model_dump()

print(temp)
print(type(temp))
print()
## for json
temps = patient1.model_dump_json()

print(temps)
print(type(temps))

print()

## include method for any specific field
temp1 = patient1.model_dump(include=['name', 'gender'])

print(temp1)
print(type(temp1))