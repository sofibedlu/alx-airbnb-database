SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.first_name,
    User.last_name
FROM 
    Booking
INNER JOIN 
    User
ON 
    Booking.user_id = User.user_id;

SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review
ON 
    Property.property_id = Review.property_id;
ORDER BY 
    Property.pricepernight, Review.created_at;

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status
FROM 
    User
FULL OUTER JOIN 
    Booking
ON 
    User.user_id = Booking.user_id;

