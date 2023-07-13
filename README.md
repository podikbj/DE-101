# DataLearning

## Description

In this project, I will consistently add homework assignments that I completed during the course DE-101.

The main purpose of this project is to demonstrate my experience with data engineering.

## Table of Contents

- Module_1

## Module 1. The role of Analytics in the Organization.
###Architecture of The Analytical Solution.

This is Data Architecture for fiction company named "FutureTech". 
Here is some information about this fiction company.

The company’s name is FutureTech.
Industry - technologies and innovations.

Needs and Expectations from the Data System:

1. Centralized Data Storage: We require a system that enables centralized storage and management
   of all our data. This includes information about our customers, products, operations, 
   finances, and other critical aspects of our business.
 
2. Integration of Data from Various Sources: We have diverse data sources such as CRM systems, 
   accounting systems, and external data providers. We want the ability to integrate and consolidate 
   these data sources into a single system for comprehensive visibility and analysis.

3. Analytics and Reporting: We need the capability to analyze our data and generate insightful
   reports and dashboards. This will help us gain valuable insights about our business, customers, 
   markets, and trends, enabling us to make more informed decisions.
 
4. Scalability and Flexibility: We desire a data system that is flexible and scalable, allowing
   us to easily add new functionalities and expand as our business grows. It should be capable of 
   accommodating increasing data volumes and adapting to evolving business needs.
 
5. User-Friendly Interface and Accessibility: The data system should have an intuitive and
   user-friendly interface that makes it easy for our team members to access and interact
   with the data. It should provide relevant data visualization and enable self-service 
   capabilities where applicable.
 
6. Collaboration and Sharing: We want the ability to collaborate within the data system, 
   allowing multiple users to access and share data securely. This promotes teamwork, 
   knowledge sharing, and efficient data-driven decision-making processes.

The data architecture solution is divided into three layers: 
Source layer, Storage layer and Access layer.
 
The Source layer defines and documents the data sources from which information will 
be received and entered into the system. 

The Source layer includes:
    - client's CRM system
    - accounting systems  
	- and external data providers such as databases, text files, images and video files.
	
The Storage Layer is represented by data warehouse.	

The Storage Layer includes:
1. Staging Area: This is where the data from the different sources is initially ingested.
   The data is typically stored in its raw or minimally transformed format. 
   The staging area allows for data validation, cleansing, and initial integration 
   before further processing.
   
2. Data Integration Layer: This layer is responsible for integrating and transforming 
   the data from the staging area. It includes processes such as data cleansing, 
   data transformation, and data standardization. Here, data from the various sources is 
   unified and prepared for loading into the data warehouse.
   
3. Data Storage Layer: This layer represents the main storage component of the data warehouse. 
   It consists of the transformed and integrated data from all the sources. 
   The data storage layer includes fact tables and dimension tables 
   to organize and store the data for efficient querying and analysis.
   
4. Access and Query Layer: This layer provides the interface for users to access and query
   the data warehouse. Users can run queries, generate reports, and perform analytics 
   on the data stored in the data warehouse.  

The Access layer focuses on providing a user-friendly interface for accessing and 
interacting with the data warehouse.   
 
The Access layer includes:
1. Reporting and Analytics Tools: Business intelligence (BI) platform Tableau.

2. Querying and Analysis: Enable users to run queries and perform ad-hoc data analysis 
   directly against the data warehouse. Provide access to a query language (such as SQL) 
   or a visual query builder(Excel and SQL).

3. Dashboards and Visualizations: Interactive dashboards and visualizations that allow 
   users to monitor key performance indicators (KPIs), track trends, and gain insights
   from the data (Python).
 

###Analytics in Excel
The Superstore.xlsx file contains several reports that analyze the input data in various aspects.   
Here is the list of reports.

Overview (обзор ключевых метрик)
 - Total Sales
 - Total Profit
 - Profit Ratio
 - Profit per Order
 - Sales per Customer
 - Avg. Discount
 - Monthly Sales by Segment ( табличка и график)
 - Monthly Sales by Product Category (табличка и график)
Product Dashboard (Продуктовые метрики)
 - Sales by Product Category over time (Продажи по категориям)
Customer Analysis
 - Sales and Profit by Customer
 - Customer Ranking
 - Sales per region




## License

This project is licensed under the [MIT License](LICENSE).


