-- Seed the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('uuid1', 'Alice', 'Smith', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    ('uuid2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password2', '0987654321', 'host', CURRENT_TIMESTAMP),
    ('uuid3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Seed the Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES 
    ('uuid4', 'uuid2', 'Cozy Apartment', 'A cozy 2-bedroom apartment in the city center.', 'Downtown, Cityville', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('uuid5', 'uuid2', 'Beach House', 'A beautiful beach house with stunning sea views.', 'Oceanfront, Beachside', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Seed the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES 
    ('uuid6', 'uuid4', 'uuid1', '2024-12-01', '2024-12-05', 'confirmed', CURRENT_TIMESTAMP),
    ('uuid7', 'uuid5', 'uuid1', '2024-12-10', '2024-12-15', 'pending', CURRENT_TIMESTAMP);

-- Seed the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('uuid8', 'uuid6', 400.00, CURRENT_TIMESTAMP, 'credit_card'),
    ('uuid9', 'uuid7', 0.00, CURRENT_TIMESTAMP, 'paypal'); -- Pending booking, no payment yet.

-- Seed the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('uuid10', 'uuid4', 'uuid1', 5, 'Fantastic place, will book again!', CURRENT_TIMESTAMP),
    ('uuid11', 'uuid5', 'uuid1', 4, 'Great views but a bit pricey.', CURRENT_TIMESTAMP);

-- Seed the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('uuid12', 'uuid1', 'uuid2', 'Hi, is the apartment available for next week?', CURRENT_TIMESTAMP),
    ('uuid13', 'uuid2', 'uuid1', 'Yes, it is available. Please confirm your booking.', CURRENT_TIMESTAMP);
