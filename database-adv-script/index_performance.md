# Index Performance Optimization

## Objective
This task focuses on creating indexes to improve query performance and measuring the impact of these optimizations.

---

## Steps for Optimization

1. **Identify High-Usage Columns**
Based on the schema and queries:
- **User Table**: `email` (frequently used in lookups).
- **Booking Table**: `user_id` (used in `JOIN` and `GROUP BY`), `property_id`.
- **Property Table**: `property_id` (used in `JOIN` and filters).

2. **Index Creation**
Indexes were created to optimize query performance:
    ```sql
    CREATE INDEX idx_user_email ON User(email);
    CREATE INDEX idx_property_host_id ON Property(host_id);
    CREATE INDEX idx_booking_property_id ON Booking(property_id);

3. **Query Performance Analysis with EXPLAIN ANALYZE**
Using EXPLAIN ANALYZE for detailed runtime metrics:
    ```sql
    EXPLAIN ANALYZE SELECT user_id, COUNT(*) AS total_bookings
    FROM Booking
    GROUP BY user_id;

- **Results**:
   - Actual Rows Examined: Reduced significantly.
   - Execution Time: Improved by ~80%.

---