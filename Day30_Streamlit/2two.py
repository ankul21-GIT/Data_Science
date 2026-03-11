
### inputs and visit

import streamlit as st


st.title("Tea Maker app")

if st.button("Make Tea"):
    st.success("Your tea is brewed")
    
add_tea = st.checkbox("Masala Tea")

if add_tea:
    st.write("Green tea is also added to your tea")
    
tea_type = st.radio("Pick your tea base", ["Water","Milk","Sugar"])
st.write(f"Selected base {tea_type}")

flavour = st.selectbox("Choose flavour", ["Adrak","Kesar","Tulsi"])
st.write(f"{flavour} tea is good flavour")


sugar = st.slider("Sugar level",0,5,2)   # 2 is the defaul value slider is on the two
st.write(f"Sugar level {sugar}")

cups = st.number_input("How many cups", min_value=1,max_value=10,step=1)
st.write(f"Number of cups {cups}")

name = st.text_input("Enter your name")
if name:
    st.write(f"Welcome {name} your tea is ready")
    
    
dob = st.date_input("Select your date of birth")
st.write(f"Your date of birth is {dob}")