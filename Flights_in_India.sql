
-- This dataset offers an in-depth look into domestic flight operations in India, sourced from Goibibo. --
-- This file contains detailed information for the period from June to August 2023. --

select *
from PortfolioProject..Flights_in_India;


-- List of all airlines --  8 airlines

select distinct Airline
from PortfolioProject..Flights_in_India
order by Airline;


-- Total number of flights -- 300,261

select count(*) as 'Number of flights'
from PortfolioProject..Flights_in_India;


-- Number of departure flights from each origin --

select Departure_From, count(Departure_From) as 'Number of flights from'
from PortfolioProject..Flights_in_India
group by Departure_From
order by count(Departure_From) desc;


-- Flight type distribution --

select Stops, count(Stops) NumberOfFlights
from PortfolioProject..Flights_in_India
group by Stops
order by NumberOfFlights desc;


-- Number of flights for each airline --

select Airline, count(Airline) as NumberOfFlights
from PortfolioProject..Flights_in_India
group by Airline
order by NumberOfFlights desc;


-- The average ticket price -- 21,137.1 INR

select round(avg(Price),1) as Avg_Price 
from PortfolioProject..Flights_in_India;


-- Number of flights for each class type -- 

select Class, count(*) as 'Number of flights'
from PortfolioProject..Flights_in_India
group by Class
order by 'Number of flights' desc;


-- Average price for each class type --

select Class, round(avg(Price),1) as Average_price
from PortfolioProject..Flights_in_India
group by Class
order by Average_price desc;


-- Top 5 flight routes --

select top 5 Departure_From, Destination, count(*) as Total_flights
from PortfolioProject..Flights_in_India
group by Departure_From, Destination
order by Total_flights desc;


--The dates with the highest number of flights --

select top 5 convert(date, Flight_date) as Flight_date, count(*) as Total_flights
from PortfolioProject..Flights_in_India
group by Flight_date
order by Total_flights desc;


-- Flights with the shortest duration for each route --

select Departure_From, Destination, min(Duration) as Shortest_Time_Duration 
from PortfolioProject..Flights_in_India
group by Departure_From, Destination;


-- The cheapest flight for each route --

select Departure_From, Destination, min(price) as Cheapest_Price
from PortfolioProject..Flights_in_India
group by Departure_From, Destination
order by Departure_From, Cheapest_Price;


-- The average ticket price for each departure city -- 

select Departure_From, round(avg(Price),0) as Avg_Price 
from PortfolioProject..Flights_in_India
group by Departure_From
order by Avg_Price desc;


-- Flight prices into categories (cheap, medium, expensive) --

select Departure_From, Destination,Airline, Flight_Num, Price,
case
	when price between 0 and 20000 then 'Cheap'
	when price between 20001 and 40000 then 'Medium'
	else 'Expensive'
end as Price_Category
from PortfolioProject..Flights_in_India;


-- Top 5 peak hours of flight departures across all airports --

select top 5 datepart(hour, Departure_time) as Departure_Hour, count(*) as Flight_Count
from PortfolioProject..Flights_in_India
group by datepart(hour, Departure_time)
order by Flight_Count desc;



--  Short Summary --

-- 1. The number of domestic flights is 300,261.

-- 2. Vistara is the airline with the highest number of flights operated: 127,859 flights.

-- 3. The average ticket price is 21,137.1 INR.

-- 4. The data indicates that Economy class is the most preferred travel option with 206,774 flights.

-- 5. Most flights typically have one stop: 250,929 flights.

-- 6. The most common flight route is Delhi-Mumbai.