# def insert_patient_data(name, age):
    
#     print(name)
#     print(age)
#     print("Inserted inot database")
    
    
# insert_patient_data("Ankur", "twelve")




def insert_patient_data(name: str, age:int):
    
    if type(name) == str and type(age) == int:
        if age < 0:
            raise ValueError("Age can't be negative")
        else:
            print(name)
            print(age)
            print("Inserted into database")
    
    else:
        raise TypeError("Incorrect Data type")


def update_patient_data(name: str, age:int):
    
    if type(name) == str and type(age) == int:
        if age < 0:
            raise ValueError("Age can't be negative")
        else:
            print(name)
            print(age)
            print("Update")
    
    else:
        raise TypeError("Incorrect Data type")


insert_patient_data("Ankur", 25)