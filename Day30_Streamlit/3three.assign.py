import streamlit as st
from datetime import date

st.title("Age Calculator")

# Ask user to select date of birth
dob = st.date_input("Select your Date of Birth", min_value=date(1900, 1, 1), max_value=date.today())

# Calculate age
if dob:
    today = date.today()
    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    st.write(f"Your age is {age} years")
