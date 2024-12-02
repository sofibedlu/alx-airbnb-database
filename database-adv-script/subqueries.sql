SELECT 
    property_id,
    name AS property_name,
    location,
    pricepernight
FROM 
    Property
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            Review
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    User
WHERE 
    (SELECT COUNT(*) 
     FROM Booking 
     WHERE Booking.user_id = User.user_id) > 3;
