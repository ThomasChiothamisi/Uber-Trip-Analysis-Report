---------UBER TRIP ANALYSIS-------------

------------------------------------------------------------------Total Bookings----------------------
SELECT COUNT(trip_id) AS total_bookings
FROM uber_trip_details;

-------------------------------------------------Total Booking Value--------------
SELECT SUM(fare_amount) + SUM(surge_fee) AS total_booking_value
FROM uber_trip_details;

----------------------------------------------Average Booking Value-----------------
SELECT CAST(AVG(fare_amount) + AVG(surge_fee) AS DECIMAL(10,2)) AS average_booking_value
FROM uber_trip_details;

--------------------------------------------Total Trip Distance-----------
SELECT SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details;

-------------------------------------------------Average Trip Distance---------
SELECT CAST(AVG(trip_distance) AS DECIMAL(10,1)) AS average_trip_distance
FROM uber_trip_details;

------------------------------------------------------Average Trip Time-------------
SELECT	AVG(DATEDIFF(MINUTE, pickup_time, drop_off_time)) AS average_trip_time_in_minutes
FROM uber_trip_details;

---------------------------------------------Total Bookings By Payment Type----------------------
SELECT payment_type,
       COUNT(trip_id) AS total_bookings
FROM uber_trip_details
GROUP BY payment_type
ORDER BY COUNT(trip_id) DESC;

-----------------------------------------------Total Booking Value By Payment Type------------------------------
SELECT payment_type,
       SUM(fare_amount) + SUM(surge_fee) AS total_booking_value
FROM uber_trip_details
GROUP BY payment_type
ORDER BY SUM(fare_amount) + SUM(surge_fee) DESC;

----------------------------------------------Total Trip Distance By Payment Type----------------------
SELECT payment_type,
       SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details
GROUP BY payment_type
ORDER BY SUM(trip_distance) DESC;

--------------------------------------------Total Bookings By Trip Type---------------------------

SELECT CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END AS trip_type,
       COUNT(trip_id) AS total_bookings
FROM uber_trip_details
GROUP BY CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END;



-------------------------------------------------Total Booking Value By Trip Type---------------------
SELECT CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END AS trip_type,
       SUM(fare_amount) + SUM(surge_fee) AS total_booking_value
FROM uber_trip_details
GROUP BY CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END;

---------------------------------------------Total Trip Distance By Trip Type----------------------
SELECT CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END AS trip_type,
       SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details
GROUP BY CASE WHEN DATEPART(HOUR, pickup_time) BETWEEN 8 AND 17 THEN 'Day Trip' ELSE 'Night Trip' END;

-------------------------------------------GRID View Of KPIs By Vehicle Type------------------------
SELECT vehicle, 
       COUNT(trip_id) AS total_bookings,
       SUM(fare_amount) + SUM(surge_fee) AS total_booking_value,
       CAST(AVG(fare_amount) + AVG(surge_fee) AS DECIMAL(10,2)) AS average_booking_value,
       SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details
GROUP BY vehicle
ORDER BY total_bookings DESC;

-------------------------------------------Total Bookings By Day-----------------
SELECT DATEPART(WEEKDAY, pickup_time) AS day_number,
       DATENAME(WEEKDAY, pickup_time) AS day_of_week,
       COUNT(trip_id) AS total_bookings
FROM uber_trip_details
GROUP BY DATENAME(WEEKDAY, pickup_time), DATEPART(WEEKDAY, pickup_time)
ORDER BY DATEPART(WEEKDAY, pickup_time);

---------------------------------------Most Frequent PickUp Point--------------------
SELECT TOP 1 location,
       city,
       COUNT(location) AS number_of_times_location_appears
FROM location_table
JOIN uber_trip_details 
ON location_table.location_id=uber_trip_details.PU_location_id
GROUP BY location, city
ORDER BY COUNT(location) DESC;

---------------------------------------Most Frequent DropOff Point---------------------
SELECT TOP 1 location,
       city,
       COUNT(location) AS number_of_times_location_appears
FROM location_table
JOIN uber_trip_details 
ON location_table.location_id=uber_trip_details.DO_location_id
GROUP BY location, city
ORDER BY COUNT(location) DESC;

------------------------------------Farthest Trip PickUp Location------------------------
SELECT TOP 1 location  AS farthest_trip_pickup_location,
       city,
       trip_distance 
FROM location_table
JOIN uber_trip_details
on location_table.location_id=uber_trip_details.PU_location_id
ORDER BY trip_distance DESC;

-----------------------------------Farthest Trip DropOff Location---------------

SELECT TOP 1 location  AS farthest_trip_dropoff_location,
       city,
       trip_distance 
FROM location_table
JOIN uber_trip_details
on location_table.location_id=uber_trip_details.DO_location_id
ORDER BY trip_distance DESC;

-----------------------------------Total Bookings By Location(TOP 5)------------------
SELECT TOP 5 location,
       COUNT(trip_id) AS total_bookings
FROM location_table
JOIN uber_trip_details 
ON location_table.location_id=uber_trip_details.PU_location_id
GROUP BY location
ORDER BY COUNT(trip_id) DESC;

--------------------------------Most Booked Vehicle By Location---------------------
SELECT location,
       vehicle,
       COUNT(vehicle) AS number_of_times_vehicle_was_booked
FROM uber_trip_details
JOIN location_table 
ON uber_trip_details.PU_location_id=location_table.location_id
GROUP BY vehicle, location
ORDER BY COUNT(vehicle) DESC;

-----------------------------Total Bookings By PickUp Time (10 Minute Interval)------------
SELECT CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME) AS pickup_time_10_minute_interval,
       COUNT(trip_id) AS total_bookings
FROM uber_trip_details
GROUP BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME)
ORDER BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME);

------------------------------Total Booking Value By PickUp Time(10 Minute Interval)-------------------------
SELECT CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME) AS pickup_time_10_minute_interval,
       SUM(fare_amount) + SUM(surge_fee) AS total_booking_value
FROM uber_trip_details
GROUP BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME)
ORDER BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME)

---------------------------Total Trip Distance By PickUp Time(10 Minute Interval)------------
SELECT CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME) AS pickup_time_10_minute_interval,
       SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details
GROUP BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME)
ORDER BY CAST(DATEADD(MINUTE, (DATEDIFF(MINUTE, 0, pickup_time) /10) *10 , 0) AS TIME)

--------------------------------------Total Bookings BY Hour And By Day---------------
SELECT DATEPART(WEEKDAY, pickup_time) AS day_number,
       DATENAME(WEEKDAY, pickup_time) AS day_of_week,
       DATEPART(HOUR, pickup_time) AS hour_of_the_day,
       COUNT(trip_id) AS total_bookings
FROM uber_trip_details
GROUP BY DATENAME(WEEKDAY, pickup_time), DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time)
ORDER BY DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time);

-------------------------------------Total Booking Value By Day And Hour------------------------
SELECT DATEPART(WEEKDAY, pickup_time) AS day_number,
       DATENAME(WEEKDAY, pickup_time) AS day_of_week,
       DATEPART(HOUR, pickup_time) AS hour_of_the_day,
       SUM(fare_amount) + SUM(surge_fee) AS total_booking_value
FROM uber_trip_details
GROUP BY DATENAME(WEEKDAY, pickup_time), DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time)
ORDER BY DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time);

-----------------------------------Total Trip Distance By Day And Hour--------------------
SELECT DATEPART(WEEKDAY, pickup_time) AS day_number,
       DATENAME(WEEKDAY, pickup_time) AS day_of_week,
       DATEPART(HOUR, pickup_time) AS hour_of_the_day,
       SUM(trip_distance) AS total_trip_distance
FROM uber_trip_details
GROUP BY DATENAME(WEEKDAY, pickup_time), DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time)
ORDER BY DATEPART(WEEKDAY, pickup_time), DATEPART(HOUR, pickup_time);

