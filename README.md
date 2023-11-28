# NYC Taxi Data Analytics
Author: Pharoah Evelyn
## Overview
#### This repository outlines the curation of a data pipeline that transforms parquet data into fact & dimension tables. 
For this project, the data is deployed to a glue catalog for visualization, but services like Redshift or Snowflake can also be employed. 

## Business Problem
We need to analyze which zip codes in NYC have the most taxi traffic to understand better how people are traveling around the city & discover insights.

## Data Preparation
I gathered the data from the NYC Taxi & Limousine Commission's website. The data is already in parquet format.
Furthermore, I downloaded shape files to extract geospatial coordinates onto our dataset.

## Methods Used
I locally developed an ETL notebook to split the raw parquet file into fact & dimension tables.
Within that notebook, I converted the shapes of the pickup zones into coordinates to have proper geospatial visualizations.

Once complete, I applied this logic to a Mage.ai data pipeline.

From Mage, we can export to a data lake or data warehouse. For the demonstration, I chose Redshift as the destination.

## Discoveries made


## Ways to improve this project
We could improve this project by web-scraping the NYC TLC website, gathering data from each month from every year, and creating a massive analysis of all historical data available.

## Conclusions
