
-- Airbnb New York 2024 Data Exploration --

select *
from PortfolioProject..Airbnb_NY_2024


-- How many Airbnb listings are in New York? -- 23,044

select count(*) as Total_listings
from PortfolioProject..Airbnb_NY_2024


-- How many Airbnb listings are in each neighbourhood_group of New York? --

select Neighbourhood_Group, count(*) as Total_listings
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood_Group
order by Total_listings desc


-- Top 5 neighborhoods with the most listings --

select top 5 Neighbourhood, count(*) as Total_listings
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood
order by Total_listings desc


-- Distribution of room types --

select Room_Type, count(*) as Total_listings
from PortfolioProject..Airbnb_NY_2024
group by Room_Type
order by Total_listings desc


-- Average price per night in each neighborhood group --

select Neighbourhood_Group, round(AVG(Price),3) as Average_price
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood_Group
order by Average_price desc


-- What is the average price across different room types --

select Room_Type, round(AVG(price),3) as Average_price
from PortfolioProject..Airbnb_NY_2024
group by Room_Type
order by Average_price desc


-- Top 5 Hosts ID in New York based on the number of listings --

select top 5 Host_ID, count(*) as Total_listings
from PortfolioProject..Airbnb_NY_2024
group by Host_ID
order by Total_listings desc


-- Top 5 most expensive neighborhoods in New York --

select top 5 Neighbourhood, round(AVG(price),3) as Average_Price
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood
order by Average_Price desc


-- Average availability of listings in each neighbourhood group --

select Neighbourhood_Group, round(AVG(Price),1) as Average_Availability
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood_Group
order by Average_Availability desc


-- Average number of reviews per month for listings in each neighbourhood group --

select Neighbourhood_Group, round(AVG(Reviews_Per_Month),3) as Avg_Reviews_Per_Month
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood_Group
order by Avg_Reviews_Per_Month desc


-- Average review scores rating for listings in each neighbourhood group --

select Neighbourhood_Group, round(AVG(Review_Scores_Rating),2) as Avg_Review_Scores_Rating
from PortfolioProject..Airbnb_NY_2024
group by Neighbourhood_Group
order by Avg_Review_Scores_Rating desc







