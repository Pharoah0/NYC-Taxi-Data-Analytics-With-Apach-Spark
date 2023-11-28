# Data Engineering with Airflow, Snowflake, DBT & Cosmos
Author: Pharoah Evelyn
## Overview
#### This repository outlines the curation of a data pipeline that utilizes the curation of an ETL pipeline using Apache Airflow, DBT & Snowflake. 
Using Docker, we create a local Airflow environment with Astronomer & its Cosmos package, simplifying transformations with DBT with Snowflake as the database. 

## Business Problem
An analysis is needed for

## Data Preparation
I generated 3 sample CSV files to operate DBT on. Within DBT, we created transformation & analysis models, which will create new tables from our data to explore.

## Methods Used
I created a DBT User, a DBT dev role, a custom warehouse & custom database on Snowflake.

I set up the Astro development environment within a local repository, with Cosmos & Airflow incorporated. I also installed a DBT environment within the dags folder containing all the data needed to execute this project. You can find all relevant files here.

## Discoveries made
I discovered that many inner workings & dependencies can cause conflict between Airflow & DBT. Utilizing Cosmos to manage DBT objects as Airflow DAGs is a massive time saver, and we all can get remarkably creative with how we incorporate DBT projects with Airflow & keep them within scope.

I also familiarized myself with Snowflake and its easy-to-use UI & incorporation into DBT & Airflow. Once all configurations were set up correctly, the data was seamlessly incorporated into my custom database. The ability to query data directly through the use of SQL worksheets was a nice bonus as well.

## Ways to improve this project
One way to improve this project is to incorporate Snowpark at the tail-end of migrating the data into the Snowflake data warehouse/database to have the ability to have some added data analysis with Python. One can also view analyzed data on a Streamlist dashboard within Snowflake.

## Conclusions