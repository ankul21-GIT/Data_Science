import streamlit as st

st.title("Election Result Poll")

# Initialize session state
if "mp_votes" not in st.session_state:
    st.session_state.mp_votes = 0
if "mla_votes" not in st.session_state:
    st.session_state.mla_votes = 0

# Layout in two columns
col1, col2 = st.columns(2)

with col1:
    st.header("MP")
    st.image("mp.jpg", caption="Member of Parliament", width=300)
    if st.button("Vote MP"):
        st.session_state.mp_votes += 1
        st.success("You voted for MP!")

with col2:
    st.header("MLA")
    st.image("mla.jpg", caption="Member of Legislative Assembly", width=300)
    if st.button("Vote MLA"):
        st.session_state.mla_votes += 1
        st.success("You voted for MLA!")

# Results section
st.subheader("Current Results")
total_votes = st.session_state.mp_votes + st.session_state.mla_votes

if total_votes > 0:
    mp_percentage = (st.session_state.mp_votes / total_votes) * 100
    mla_percentage = (st.session_state.mla_votes / total_votes) * 100

    st.write(f"MP Votes: **{st.session_state.mp_votes}** ({mp_percentage:.1f}%)")
    st.write(f"MLA Votes: **{st.session_state.mla_votes}** ({mla_percentage:.1f}%)")

    st.progress(int(mp_percentage))
    st.progress(int(mla_percentage))
else:
    st.write("No votes yet. Cast your vote above!")
