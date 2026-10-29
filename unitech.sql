# Select the UniTech database to work with
USE unitech;

# CLASS PROJECT: RETAIL STORE SALES ANALYSIS
# BUSINESS CASE:
# DATE CREATED: 27-09-2026
# A retail store has been selling different kinds of products through both online and retail channels. The business also has both new and returning customers.
# The management team wants to better understand how the business is performing by analyzing its sales data. They want to discover important patterns, customer behavior, top performing products, and areas where the business can improve.

# VIEW FIVE RECORDS
# Display the first five records from the furniture table.
SELECT*
FROM furniture
LIMIT 5;

# VIEW THE TABLE STRUCTURE
# Display the column names, data types, and other properties of the furniture table.
DESCRIBE furniture;

# CHECK FOR DUPLICATE RECORDS
# NOTE: This query identifies records that share the same values across the listed columns.
SELECT*,
count(*) AS Duplicate_Value
FROM furniture
GROUP BY Product, Sales_rep, Region, Customer, Date, Unit_price, Quantity, Total_sales
HAVING count(*)>1;

# BUSINESS CASE 1: OVERVIEW OF BUSINESS METRICS
# BUSINESS QUESTION: What are the key business metrics saying?
# NOTE: Total_sales is treated as the Revenue field.
SELECT format(sum(Total_sales),2) AS Revenue
FROM furniture;

# Overview of Quantity Sold
SELECT format(sum(Quantity),0) AS Quantity_Sold
FROM furniture;

# BUSINESS CASE 2: PRODUCT PERFORMANCE
# BUSINESS QUESTION: Which product category has the highest quantity sold?
SELECT Product,
format(sum(Quantity),0) AS Quantity_Sold
FROM furniture
GROUP BY Product
ORDER BY Quantity_Sold DESC;

# BUSINESS CASE 3: PROFIT FROM NEW AND RETURNING CUSTOMERS
# BUSINESS QUESTION: How much profit comes from new and returning customers
# The current dataset does not contain the required profit fields

# BUSINESS CASE 4: MONTHLY CUSTOMER PATRONAGE
# BUSINESS QUESTION: Can we see our revenue for the last 3 years?
SELECT year(date) AS year,
format(sum(Total_sales), 2) AS Revenue
FROM furniture
GROUP BY year(date)
ORDER BY Revenue DESC;

# BUSINESS CASE 5: 
# BUSINESS QUESTION: Which year do we have the highest patronage?
SELECT year(date) AS year,
count(customer) AS Customer
FROM furniture
GROUP BY year(date)
ORDER BY customer DESC;

# BUSINESS CASE 6: REGIONAL MARKET PERFORMANCE
# BUSINESS QUESTION: Which region dominates the market in terms of profit?
SELECT region,
format(sum(Quantity),0) AS Quantity_Sold
FROM furniture
GROUP BY region
ORDER BY Quantity_Sold DESC;

# BUSINESS CASE 7: SALES CHANNEL PREFERENCE
# BUSINESS QUESTION: Do customers prefer online or physical retail sales?
# A Sales_Channel column containing values such as 'Online' and 'Retail' is required for this analysis

# BUSINESS CASE 8: SALES REPRESENTATIVE PERFORMANCE
# BUSINESS QUESTION: Which sales representative sells the most products?
SELECT Sales_rep,
SUM(Quantity) AS Quantity_Sold
FROM furniture
GROUP BY Sales_rep
ORDER BY Quantity_sold DESC

# BUSINESS CASE 9: PAYMENT METHOD ANALYSIS
# BUSINESS QUESTION: Which payment method is used the most?
# The current furniture table does not contain a Payment_Method field.

# DATA LIMITATIONS
# 📈 Limited Data Period: The dataset covers only 2014–2015, so it may not reflect current sales performance or recent market trends.
# 📈 Lack of Profit Information: The dataset does not include product costs or profit margins, making it impossible to determine the most profitable products.
# 📈 Missing Sales Channel Information: The dataset does not specify whether sales occurred online or in physical stores, limiting comparisons between sales channels.
# 📈 Missing Payment Method Information: The dataset does not include payment methods, preventing analysis of customer payment preferences.
# 📈 Limited Customer Information: The dataset contains only five customer names and lacks unique customer identifiers or detailed customer records, limiting the ability to accurately analyze customer behavior and distinguish new customers from returning customers.

# KEY FINDINGS:
# 🔑 Overall Sales Performance: The business generated total revenue of 2,831,665.67 from 7,997 units sold across 909 sales records between January 2014 and December 2015.
# 🔑 Product Performance: Media Armoire recorded the highest quantity sold, with 1,815 units, while Chameleon Couch generated the highest revenue of 1,343,116.05.
# 🔑 Yearly Revenue Growth: Revenue increased from 1,389,110.80 in 2014 to 1,442,554.87 in 2015, representing an increase of approximately 3.85%.
# 🔑 Regional Sales Performance: South West generated the highest revenue of 998,636.31, while North East recorded the highest quantity sold, with 2,807 units.
# 🔑 Sales Representative Performance: Ramey, Sam recorded the highest sales quantity, with 1,068 units, generating revenue of 362,436.56.

# RECOMMENDATIONS: 
# 💡 Improve Product Management: Maintain sufficient stock of high-performing products, especially Media Armoire and Chameleon Couch, while reviewing the demand for lower-performing products.
# 💡 Strengthen Regional Sales: Investigate the success of the South West region and apply its effective sales strategies to regions with lower revenue, particularly South East.
# 💡 Reward and Support Sales Representatives: Recognize top performer Ramey, Sam, and provide additional training and support to representatives with lower sales performance.
# 💡 Increase Revenue Growth: Develop targeted promotions, marketing campaigns, and sales strategies to improve revenue and encourage more product purchases.
# 💡 Improve Data Collection: Include additional fields such as product cost, profit, sales channel, payment method, and unique customer ID to support profitability analysis and better business decisions.
