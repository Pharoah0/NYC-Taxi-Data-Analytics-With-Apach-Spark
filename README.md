# NYC Taxi Data Analytics

Author: Pharoah Evelyn

<p align="center">
    <img src="https://github.com/Pharoah0/NYC-Taxi-Data-Analytics-With-Apach-Spark/blob/main/images/NYC_Taxi.png" />
</p>

## Overview

#### This repository outlines the curation of a data pipeline that transforms parquet data into fact & dimension tables.

For this project, the data is deployed to a glue catalog for visualization, but services like Redshift or Snowflake can also be employed.

## Business Problem

We need to analyze which zip codes in NYC have the most taxi traffic to understand better how people are traveling around the city & discover insights.

## Data Preparation

I gathered the data from the [NYC Taxi & Limousine Commission's website](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page), based on August 2023. The data is already in parquet format.
Furthermore, I downloaded shape files to extract geospatial coordinates onto our dataset.

## Methods Used

I locally developed a Jupyter notebook to prepare the original data by extracting coordinates from the shapefile provided by the NYC TLC website.

Next, Apache Spark was employed in another ETL notebook to split the raw parquet file into fact & dimension tables.
Once complete, I uploaded the data to S3 & then copied the data into Redshift for querying.

Within Redshift, I also created a new table by joining dimensions from all available tables. Once complete, I unloaded the fact table& new table into S3 for upload into Github.

## Discoveries made

## Ways to improve this project

We could improve this project by web-scraping the NYC TLC website, gathering data from each month from every year, and creating a massive analysis of all historical data available.

One could also employ this architecture within the cloud 100%:

Example 1:
Deploy in AWS by utilizing a Spark environment with the use of Amazon EMR and having the ability to transfer the files via EMRFS.

<p align="center">
    <img src="https://github.com/Pharoah0/NYC-Taxi-Data-Analytics-With-Apach-Spark/blob/main/images/NYC_Taxi_Cloud_V1.png" />
</p>

Example 2:
Alternatively, we could use a Glue Notebook in the place of an EMR - with the use of automatic triggers with an additional Lambda function. Though, we'd need different schemas for each table so the Glue Crawler can read each schema properly.

<p align="center">
    <img src="https://github.com/Pharoah0/NYC-Taxi-Data-Analytics-With-Apach-Spark/blob/main/images/NYC_Taxi_Cloud_V2.png" />
</p>

## Conclusions
