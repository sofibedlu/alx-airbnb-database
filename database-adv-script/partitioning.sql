-- Drop existing Booking table if partitioning is required and it's not yet applied
-- WARNING: This will remove data; ensure you back up data before executing
DROP TABLE IF EXISTS Booking;

-- Create Booking table with partitioning by RANGE on the start_date column
CREATE TABLE Booking (
    booking_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('confirmed', 'cancelled', 'pending') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY (start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);



-- Query on the partitioned table
SELECT 
    booking_id, user_id, property_id, start_date, end_date, status
FROM 
    Booking 
WHERE 
    start_date BETWEEN '2024-01-01' AND '2024-12-31';
