## pandas read file


import streamlit as st
import pandas as pd

file = st.file_uploader("Upload your csv file", type=["csv"])

if file:
    df = pd.read_csv(file)
    st.subheader("datapreview")
    st.dataframe(df)
    
if file:
    st.subheader("Summary Stats")
    st.write(df.describe())
    
if file:
    cities = df['City'].unique()
    selected_city =st.selectbox("Filter by cities", cities)
    filter_data = df[df["City"] == selected_city]
    st.dataframe(filter_data)
    