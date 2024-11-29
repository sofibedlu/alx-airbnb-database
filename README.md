# ALX Airbnb Database

## Objective
This project aims to design and implement a database schema for an Airbnb-like application. The schema includes tables for users, properties, bookings, payments, reviews, and messages, ensuring data integrity, scalability, and optimized query performance.

## Database Schema Design (DDL)
The database schema is defined in the `schema.sql` file located in the `database-script-0x01` directory. It includes:
1. **Table Definitions**: Create tables with appropriate columns, data types, and constraints.
2. **Relationships**: Define foreign keys to establish connections between tables.
3. **Indexes**: Add indexes to optimize query performance for frequently used columns.

### Key Features
- **Primary Keys**: Automatically indexed to uniquely identify rows.
- **Foreign Keys**: Establish relationships between entities (`User`, `Property`, etc.).
- **Constraints**: Maintain data integrity (e.g., `NOT NULL`, `UNIQUE`, `CHECK`).
- **Indexes**: Improve query performance for frequently accessed columns.

## Seeding the Database with Sample Data
The `seed.sql` file in the `database-script-0x02` directory contains SQL `INSERT` statements to populate the database with sample data. This data includes users, properties, bookings, payments, reviews, and messages to simulate real-world scenarios.

## Database Requirements
The [requirements.md] file in the [ERD] directory outlines the database design and requirements, including entities, attributes, relationships, and key constraints.

## Normalization
The [normalization.md]file provides an overview of the normalization process applied to the database schema, ensuring that all tables are normalized to the Third Normal Form (3NF).

## Notes
1. The schema adheres to the **Third Normal Form (3NF)** to minimize redundancy and ensure data integrity.
2. Constraints such as `NOT NULL`, `UNIQUE`, and `CHECK` are used to enforce data quality.
3. Indexing has been applied selectively to improve performance for frequent queries.
4. The seed data is for testing and development purposes only and should not be used in production environments.

## Tools
The ER diagram was created using [Draw.io/Diagrams.net]. You can view or edit the diagram in the provided file.

---