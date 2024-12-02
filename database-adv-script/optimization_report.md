# Query Optimization Report

## Objective
Refactor a complex query to improve performance while retrieving bookings with user, property, and payment details.

## Initial Query
- The initial query joins multiple tables (`Booking`, `User`, `Property`, and `Payment`) and retrieves all columns without filtering.  
This query processes a large volume of data, leading to inefficiencies.

    ```sql
    SELECT 
        Booking.booking_id,
        Booking.start_date,
        Booking.end_date,
        Booking.status,
        Booking.total_price,
        User.user_id,
        User.first_name,
        User.last_name,
        User.email,
        Property.property_id,
        Property.name AS property_name,
        Property.location,
        Property.pricepernight,
        Payment.payment_id,
        Payment.amount,
        Payment.payment_date,
        Payment.payment_method
    FROM 
        Booking
    JOIN 
        User ON Booking.user_id = User.user_id
    JOIN 
        Property ON Booking.property_id = Property.property_id
    LEFT JOIN 
        Payment ON Booking.booking_id = Payment.booking_id;

**Performance Analysis (EXPLAIN)**
- Type: Full table scan (ALL) in some joins.
- Rows: High number of rows processed due to no filtering.
- Keys: Limited index usage.

---

## Refactored Query
- The optimized query limits retrieved columns, applies table aliases for clarity, and adds a WHERE clause to filter by start_date.

    ```sql
    SELECT 
        b.booking_id,
        b.start_date,
        b.end_date,
        b.status,
        u.user_id,
        u.first_name,
        u.last_name,
        p.property_id,
        p.name AS property_name,
        p.location,
        pm.payment_id,
        pm.amount
    FROM 
        Booking AS b
    JOIN 
        User AS u ON b.user_id = u.user_id
    JOIN 
        Property AS p ON b.property_id = p.property_id
    LEFT JOIN 
        Payment AS pm ON b.booking_id = pm.booking_id
    WHERE 
        b.start_date >= '2024-01-01';

**Improvements**
- Reduced Columns: Only necessary columns selected.
- Added Filter: Limits data with a WHERE clause.
- Key Usage: Optimized joins leverage indexes on user_id, property_id, and - booking_id.

---


