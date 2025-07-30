Airbnb Listings Data Analysis – New York City 2024

Project Description  
This project focuses on analyzing Airbnb listings data from New York City for the year 2024 to uncover insights regarding property prices, availability, and host activity. 
The dataset contains more than 37,000 listings with information such as property details, location, price, reviews, and host information.

Using SQL as the primary tool, the data was cleaned, queried, and analyzed to identify trends and anomalies. 
The analysis includes price distributions by room type and neighborhood, identification of the most expensive properties, the most active hosts, and the proportion of listings available year-round.


Summary
* Hotel rooms were the most expensive category, with an average price of $395.
* Manhattan and Brooklyn dominate the market, holding nearly 50% of the total listings.
* Riverdale, SoHo, and Battery Park City ranked among the most expensive neighborhoods.
* Only 9.7% of listings are available all 365 days of the year, showing that most hosts operate seasonally.
* Several "mega-hosts," such as Blueground, manage hundreds of properties, indicating a highly commercialized segment of the market.



-- How many Airbnb listings are in New York? -- 37,784

select count(*) as Total_listings
from PortfolioProject..ListingsAirbnb24


-- How many Airbnb listings are in each neighbourhood_group of New York? --

select Neighbourhood_Group, count(*) as Total_listings
from PortfolioProject..ListingsAirbnb24
group by Neighbourhood_Group
order by Total_listings desc


-- Top 5 neighborhoods with the most listings --

select top 5 Neighbourhood, Neighbourhood_Group, COUNT(*) AS Num_listings
from PortfolioProject..ListingsAirbnb24
group by Neighbourhood, Neighbourhood_Group
order by Num_listings desc;


-- Distribution of room types --

select Room_Type, count(*) as Total_listings
from PortfolioProject..ListingsAirbnb24
group by Room_Type
order by Total_listings desc


-- Average price per night in each neighborhood group --

select Neighbourhood_Group, round(AVG(Price),3) as Average_price
from PortfolioProject..ListingsAirbnb24
where price is not null
group by Neighbourhood_Group
order by Average_price desc


-- What is the average price across different room types --

select Room_Type, round(AVG(price),3) as Average_price
from PortfolioProject..ListingsAirbnb24
group by Room_Type
order by Average_price desc


-- Top 5 Hosts in New York based on the number of listings --

select top 5 host_name, Host_ID, count(*) as Total_listings
from PortfolioProject..ListingsAirbnb24
group by Host_ID, host_name
order by Total_listings desc


-- Top 5 most expensive neighborhoods in New York --

select top 5 Neighbourhood,Neighbourhood_Group, round(AVG(price),3) as Average_Price
from PortfolioProject..ListingsAirbnb24
group by Neighbourhood, Neighbourhood_Group
order by Average_Price desc


-- Top 3 most expensive listings in New York --

select top 3 name, price
from PortfolioProject..ListingsAirbnb24
order by price desc


-- Average availability of listings in each neighbourhood group --

select Neighbourhood_Group, round(AVG(Price),1) as Average_Availability
from PortfolioProject..ListingsAirbnb24
group by Neighbourhood_Group
order by Average_Availability desc


-- Average number of reviews per month for listings in each neighbourhood group --

select Neighbourhood_Group, round(AVG(Reviews_Per_Month),3) as Avg_Reviews_Per_Month
from PortfolioProject..ListingsAirbnb24
group by Neighbourhood_Group
order by Avg_Reviews_Per_Month desc


-- What percentage of properties are available year-round? -- 9.69%

SELECT 
    COUNT(CASE 
					WHEN availability_365 = 365 THEN 1 
				END
				) * 100.0 / COUNT(*) AS fully_available_pct
from PortfolioProject..ListingsAirbnb24;
