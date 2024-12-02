---Creating indexes for the database tables:
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);


---Using EXPLAIN ANALYZE for detailed runtime metrics:
EXPLAIN ANALYZE SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;
