-- Create database if not exists (run as a user with CREATE DATABASE privileges)
IF DB_ID(N'HotelBooking') IS NULL
BEGIN
    CREATE DATABASE HotelBooking;
END
GO

USE HotelBooking;
GO

-- Minimal table structures (columns based on provided sample).
-- Extend columns as needed (see data/sample.csv).

CREATE TABLE IF NOT EXISTS [dbo].[2018$] (
    hotel NVARCHAR(100),
    is_canceled INT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month NVARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    adults INT,
    children INT,
    babies INT,
    meal NVARCHAR(10),
    country NVARCHAR(10),
    market_segment NVARCHAR(100),
    distribution_channel NVARCHAR(100),
    is_repeated_guest INT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type NVARCHAR(10),
    assigned_room_type NVARCHAR(10),
    booking_changes INT,
    deposit_type NVARCHAR(50),
    agent NVARCHAR(50),
    company NVARCHAR(50),
    days_in_waiting_list INT,
    customer_type NVARCHAR(50),
    adr DECIMAL(10,2),
    required_car_parking_spaces INT,
    total_of_special_requests INT,
    reservation_status NVARCHAR(50),
    reservation_status_date NVARCHAR(50)
);

-- Clone structure for 2019$ and 2020$
IF OBJECT_ID('dbo.[2019$]') IS NULL
BEGIN
    SELECT TOP 0 * INTO [dbo].[2019$] FROM [dbo].[2018$];
END

IF OBJECT_ID('dbo.[2020$]') IS NULL
BEGIN
    SELECT TOP 0 * INTO [dbo].[2020$] FROM [dbo].[2018$];
END

-- Lookup tables
IF OBJECT_ID('dbo.[market_segment$]') IS NULL
BEGIN
    CREATE TABLE [dbo].[market_segment$] (
        market_segment NVARCHAR(100) PRIMARY KEY,
        segment_description NVARCHAR(255)
    );
END

IF OBJECT_ID('dbo.[meal_cost$]') IS NULL
BEGIN
    CREATE TABLE [dbo].[meal_cost$] (
        meal NVARCHAR(20) PRIMARY KEY,
        cost_per_meal DECIMAL(10,2)
    );
END
