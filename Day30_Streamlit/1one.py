import streamlit as st


st.title("My first sreamlit")
st.subheader("Brewed with streamlit")
st.text("How is my first framework")
st.write("It's easy to learn")


sub = st.selectbox("Your favourate subject", ["DSA","DCN","Python"])
st.write(f"You choose {sub} it's excellent choice")



st.title("Choose Your Favourite Subject")
subject = st.selectbox("Your favourite subject", ["DSA", "DCN", "Python"])
st.write(subject)


