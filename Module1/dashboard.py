import streamlit as st

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd


def main():

    # Заголовок
    st.title("Superstore Dashboard")

    # # Текст
    # st.write('Привет, мир!')
    df = pd.read_excel('superstore.xlsx', sheet_name="Orders")


    # Create a line plot with specified labels and title
    def create_line_plot(xlabel, ylabel, title, fontsize=16, rotation=45):
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.title(title, fontsize=fontsize)
        plt.xticks(rotation=rotation)


    # Convert 'OrderDate' column to datetime if it's not already in datetime format
    try:
        df['OrderDate'] = pd.to_datetime(df['Order Date'])
    except pd.errors.ParserError as e:
        st.error("Error parsing dates. Please ensure the 'Order Date' column is in a valid date format (e.g., YYYY-MM-DD).")
        st.stop()

    # Total sales report
    period = 'YearMonth'
    metrik = 'Sales'

    # Calculate total sales by month and year
    df[period] = df['OrderDate'].dt.to_period('M')
    data_to_show = df.groupby(period)[metrik].sum().reset_index()
    data_to_show[period] = data_to_show[period].astype(str)

    plt.figure(figsize=(12, 6))
    sns.set_style('darkgrid')
    sns.lineplot(data=data_to_show, x=period, y=metrik)

    create_line_plot(xlabel='Year-Month', ylabel='Total Sales',
                     title='Total Sales by Month and Year')

    # Display the graph within Streamlit app
    st.pyplot(plt)

    # Define a slider for selecting time range
    df['Year'] = df['OrderDate'].dt.year
    df['Month'] = df['OrderDate'].dt.month_name()
    start_year = st.sidebar.slider('Select Start Year', min_value=int(df['Year'].min()), max_value=int(df['Year'].max()))
    end_year = st.sidebar.slider('Select End Year', min_value=int(df['Year'].min()), max_value=int(df['Year'].max()))
    # Filter the data based on selected time range
    filtered_data = df[(df['Year'] >= start_year) & (df['Year'] <= end_year)]

    # Total Profit Report
    period = ['Year', 'Month']
    metrik = 'Profit'

    # Calculate total Profit by month and year
    data_to_show = filtered_data.groupby(period)[metrik].sum().reset_index()

    plt.figure(figsize=(12, 6))
    sns.lineplot(data=data_to_show, x='Month', y=metrik, hue='Year', style='Year', palette='colorblind', dashes=False)
    create_line_plot(xlabel='Month', ylabel='Total Profit', title='Total Profit by Month and Year')

    plt.legend(title='Year')
    st.pyplot(plt)

    # Profit Ratio Report

    metrik = 'GrossProfitMargin'

    # Calculate total Profit by month and year
    data_to_show = filtered_data.groupby(period)[metrik].sum().reset_index()

    plt.figure(figsize=(12, 6))
    sns.lineplot(data=data_to_show, x='Month', y=metrik, hue='Year', style='Year', palette='colorblind', dashes=False)
    create_line_plot(xlabel='Month', ylabel='Profit Ratio', title='Profit Ratio by Month and Year')

    plt.legend(title='Year')
    st.pyplot(plt)

    # Sales per Region Report
    # Group the data by OrderID and calculate profit per order
    col = 'Region'
    period = ['Year', 'Month', 'Region']
    metrik = 'Sales'
    # profit_per_order = df.groupby(col)[metrik].sum().reset_index()
    profit_per_order = filtered_data.groupby(col)[metrik].sum().reset_index()

    # Create the bar plot
    plt.figure(figsize=(12, 6))
    plt.bar(profit_per_order[col], profit_per_order[metrik])
    plt.xlabel(col)
    plt.ylabel(metrik)
    plt.title('Sales per Region Report')
    plt.xticks(rotation=45)

    # Display the plot in Streamlit
    st.pyplot(plt)


if __name__ == '__main__':
    main()
