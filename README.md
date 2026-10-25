# Uber-Trip-Analysis-Report

This project analyses Uber trip data using SQL Server and Power BI to understand booking activity, revenue, trip patterns, vehicle performance, payment behaviour and location trends. The analysis transforms raw trip data into business-focused KPIs and an interactive Power BI dashboard. The objective was to analyse Uber trip data and answer key business questions around booking volume and booking value, trip distance and duration, vehicle performance and payment preferences.

**SQL Analysis**

SQL Server was used to calculate KPIs and perform the underlying business analysis.

Key areas include:

- Total Bookings
- Total Booking Value
- Average Booking Value
- Total and Average Trip Distance
- Average Trip Time
- Bookings and booking value by payment type
- Day vs Night trip analysis
- Vehicle performance analysis
- Bookings by day of the week
- Most frequent pickup and drop-off locations
- Farthest pickup and drop-off locations
- Top five booking locations

The analysis uses SQL techniques including COUNT(), SUM(), AVG(), CASE, DATEDIFF(), DATEPART(), DATENAME(), TOP, GROUP BY, ORDER BY and table joins.

[View SQL Query Script & Screenshots](./SQL%20Queries)

**Power BI Data Model & Dashboard**

The Power BI data model uses uber_trip_details as the central fact table, connected to separate pickup and drop-off location tables and a calendar table for time-based analysis. A Measure Selector table supports dynamic metric selection within the dashboard. The model enables analysis across bookings, vehicle types, payment methods, trip timing and locations, while the dashboard presents these results through KPI cards, charts and interactive filters for date and city.

**Key Dashboard Metrics**

- 103.7K Total Bookings
- $1.6M Total Booking Value
- $15 Average Booking Value
- 349K miles Total Trip Distance
- 3 miles Average Trip Distance

[View Power BI Dashboard & Screenshots](./Power%20BI)

**Key Insights**

- UberX has the highest booking volume with 38,744 bookings and approximately $583.9K in booking value.
- Day trips account for approximately 67.7K bookings, compared with 36.0K night trips.
- Sunday has the highest booking volume at 19,165 bookings, while Friday has the lowest at 9,260.
- Uber Pay is the largest payment category in the dashboard.
- The average trip is approximately 3 miles and 16 minutes.
- Penn Station/Madison Sq West is the most frequent pickup point, while Upper East Side North is the most frequent drop-off point.

**Recommendations**

- Prioritise driver availability on high-demand days: Sunday and Saturday record the highest booking volumes, so Uber should ensure sufficient driver availability and vehicle supply during these periods to meet demand.
- Optimise driver positioning around high-volume locations: Penn Station/Madison Sq West is the most frequent pickup point, while Upper East Side North is the most frequent drop-off point. Uber can use these demand hotspots to improve driver positioning and reduce potential passenger wait times.
- Increase focus on UberX capacity: UberX generates significantly more bookings than the other vehicle categories. Uber should prioritise maintaining adequate UberX availability in high-demand areas and periods.
- Strengthen digital payment adoption: Uber Pay is the largest payment category. Uber can continue encouraging digital payments through app-based payment convenience and targeted incentives, while maintaining cash as an available option.
- Review resource allocation on lower-demand days: Friday has the lowest booking volume at 9,260. Driver supply and operational resources could be adjusted during lower-demand periods to improve utilisation and avoid excess supply.
- Use demand patterns to improve vehicle allocation: The strong difference between day and night bookings suggests that vehicle availability can be weighted toward daytime demand, while maintaining sufficient coverage for the smaller night-trip segment.
- Target high-volume locations with operational incentives: Pickup hotspots could be used for driver incentives or positioning strategies during busy periods, helping ensure supply is available where booking activity is concentrated.

**Tools & Technologies**

- SQL Server - Data querying, KPI calculations and business analysis
- Power BI - Dashboard development and data visualisation
- GitHub - Project documentation and portfolio presentation
