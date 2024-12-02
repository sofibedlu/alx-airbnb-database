-- Retrieve all bookings along with user, property, and payment details
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

-- Analyze Query Performance
EXPLAIN SELECT 
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

-- Refactor the Query
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
    b.start_date >= '2024-01-01'
    AND b.status = 'confirmed'; -- Example filter for optimization
