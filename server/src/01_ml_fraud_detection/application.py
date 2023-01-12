# Import required libraries
from snowflake.snowpark.session import Session
from snowflake.snowpark.functions import avg, sum, col,lit
import pydeck as pdk
from streamlit_echarts import st_echarts
import streamlit as st
import pandas as pd
import random

# Create Session object
def create_session_object():
    connection_parameters = {
        "account": "XXXXX",
        "user": "XXX",
        "password": "XXXX",
        "role": "SYSADMIN",
        "warehouse": "SMALL_WH",
        "database": "FRAUD_DB",
        "schema": "PUBLIC"
    }
    session = Session.builder.configs(connection_parameters).create()
    return session

def load_data(session):

    snow_df_orders = session.table("DEMO.FRAUDDEMO.ENRICHED_DATA").filter(col("IP_ORDER_LOC_LAT").isNotNull())

    snow_df_orders = snow_df_orders.group_by(["IP_ORDER_LOC_LNG","IP_ORDER_LOC_LAT","SHIPPING_LNG","SHIPPING_LAT"]).agg((col("*"),"count")).limit(2000).to_pandas()

    zipcodes_by_ip_address = session.table("DEMO.FRAUDDEMO.ZIPCODES_BY_IP_ADDRESS")

    with st.container():

        st.write('# Snowflake: Enriched Data')
        st.markdown('''
            This is an application created by using the enriched data from a Machine Learning model.
        ''')
        st.header('Overview')
        st.subheader('Orders Table')
        st.dataframe(zipcodes_by_ip_address, use_container_width=True)
        st.subheader('Orders per City')
        st.bar_chart(data=zipcodes_by_ip_address, x='CITY', y='ORDERS', use_container_width=True)

        st.subheader('Mapping Orders')
        GREEN_RGB = [64, 255, 0]
        RED_RGB = [0, 128, 200]
        st.pydeck_chart(pdk.Deck( pdk.Layer(
            "ArcLayer",
            data=snow_df_orders,
            get_width=random.randint(1, 5),
            get_source_position=["IP_ORDER_LOC_LNG", "IP_ORDER_LOC_LAT"],
            get_target_position=["SHIPPING_LNG", "SHIPPING_LAT"],
            get_tilt=15,
            get_source_color=RED_RGB,
            get_target_color=GREEN_RGB,
            pickable=True,
            auto_highlight=True,
        )))

if __name__ == "__main__":
    session = create_session_object()
    load_data(session)
