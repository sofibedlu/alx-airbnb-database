# Database Schema Design (DDL)

## Objective
This document outlines the database schema for the Airbnb-like application. The schema is designed to meet the provided specifications, incorporating primary keys, foreign keys, constraints, and indexing for optimal performance.

---

## Schema Design Summary
The database contains six main entities: `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`. Each table has been designed with the following considerations:
1. **Primary Keys**: Ensure unique identification of records.
2. **Foreign Keys**: Define relationships between entities.
3. **Constraints**: Maintain data integrity (e.g., `NOT NULL`, `UNIQUE`, `CHECK`).
4. **Indexes**: Improve query performance for frequently accessed columns.

---

## SQL Schema
The full SQL schema is available in the `schema.sql` file. It contains:
1. **Table Definitions**: Create tables with appropriate columns, data types, and constraints.
2. **Relationships**: Define foreign keys to establish connections between tables.
3. **Indexes**: Add indexes to optimize query performance for frequently used columns.

### Key Features
- **Primary Keys**: Automatically indexed to uniquely identify rows.
- **Foreign Keys**: Establish relationships between entities (`User`, `Property`, etc.).
- **Additional Indexes**:
  - `User.email` for faster email lookups.
  - `Booking.property_id` for optimizing joins between `Booking` and `Property`.
  - `Payment.booking_id` for optimizing joins between `Payment` and `Booking`.

---

## How to Use the Schema
1. Ensure you have access to a database management system (e.g., MySQL, PostgreSQL).
2. Save the `schema.sql` file to your local system.
3. Run the file using your preferred SQL client or command-line tool:
   - **MySQL**:
     ```bash
     mysql -u <username> -p <database_name> < schema.sql
     ```
   - **PostgreSQL**:
     ```bash
     psql -U <username> -d <database_name> -f schema.sql
     ```

---

## Notes
1. The schema adheres to the **Third Normal Form (3NF)** to minimize redundancy and ensure data integrity.
2. Constraints such as `NOT NULL`, `UNIQUE`, and `CHECK` are used to enforce data quality.
3. Indexing has been applied selectively to improve performance for frequent queries.

---
