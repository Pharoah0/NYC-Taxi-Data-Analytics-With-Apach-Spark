-- Viewing Fact Table
SELECT *
FROM "dev"."public"."fact_table";

-- Selecting Average Fare Amount per Vendor ID
Select VendorID , AVG(fare_amount) From fact_table
Group By VendorID;

-- Selecting Average Tip Ammounts per Payment Type
Select b.payment_type_name, AVG(a.tip_amount) From fact_table a
Join payment_type_dim b On a.payment_type_id = b.payment_type_id
Group By b.payment_type_name;

-- Selecting the Top 10 Pickup Locations Based On the Number of Trips
Select Count(a.pickup_location_id) As "Locations", b.PU_Lon, b.PU_lat From fact_table a
Join pickup_location_dim b On a.pickup_location_id = b.pickup_location_id
Group By b.PU_Lon, b.PU_lat
Order By "Locations" Desc
Limit 10;

-- Selecting the Total Number of Trips by Passenger Count
Select COUNT(a.passenger_count_id) As "number of trips", b.passenger_count From fact_table a 
Join passenger_count_dim b On a.passenger_count_id = b.passenger_count_id
Group By b.passenger_count
Order By "number of trips" Desc;

-- Selecting the Average Fare Amount by Hour of Day
Select b.drop_off_hour, Avg(a.fare_amount) From fact_table a 
Join datetime_dim b On a.datetime_id = b.datetime_id
Group By b.drop_off_hour
Order By "avg" Desc;

-- Creating Analytical Table for Data Visualization
Create Table "dev"."public"."tbl_analytics" As(
Select 
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.PU_Lat,
pick.PU_Lon,
dropo.DO_Lat,
dropo.DO_Lon,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge
From 
fact_table f
Join datetime_dim d On f.datetime_id = d.datetime_id
Join passenger_count_dim p On p.passenger_count_id = f.passenger_count_id
Join trip_distance_dim t On t.trip_distance_id = f.trip_distance_id
Join rate_code_dim r On r.ratecode_id = f.ratecode_id
Join pickup_location_dim pick On pick.pickup_location_id = f.pickup_location_id
Join dropoff_location_dim dropo On dropo.dropoff_location_id = f.dropoff_location_id
Join payment_type_dim pay On pay.payment_type_id = f.payment_type_id)
;

-- Unloading Data to S3
UNLOAD ('Select * From tbl_analytics')
To 'My_S3_ARN'
iam_role 'My_IAM_Role_ARN'
Format as PARQUET
parallel off
Maxfilesize as 100 MB;

UNLOAD ('Select * From fact_table')
To 'My_S3_ARN'
iam_role 'My_IAM_Role_ARN'
Format as PARQUET
parallel off
Maxfilesize as 100 MB;