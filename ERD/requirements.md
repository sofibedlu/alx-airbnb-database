# Database Requirements for Airbnb System

## Overview
This document outlines the database design and requirements for the Airbnb-like system. It includes the defined entities, their attributes, relationships, and key constraints.

---

## Entities and Attributes

### 1. **User**
- **Primary Key**: `user_id` (UUID, Indexed)
- **Attributes**:
  - `first_name`: VARCHAR, NOT NULL
  - `last_name`: VARCHAR, NOT NULL
  - `email`: VARCHAR, UNIQUE, NOT NULL
  - `password_hash`: VARCHAR, NOT NULL
  - `phone_number`: VARCHAR, NULL
  - `role`: ENUM (`guest`, `host`, `admin`), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. **Property**
- **Primary Key**: `property_id` (UUID, Indexed)
- **Attributes**:
  - `host_id`: Foreign Key, references `User(user_id)`
  - `name`: VARCHAR, NOT NULL
  - `description`: TEXT, NOT NULL
  - `location`: VARCHAR, NOT NULL
  - `pricepernight`: DECIMAL, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. **Booking**
- **Primary Key**: `booking_id` (UUID, Indexed)
- **Attributes**:
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `total_price`: DECIMAL, NOT NULL
  - `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. **Payment**
- **Primary Key**: `payment_id` (UUID, Indexed)
- **Attributes**:
  - `booking_id`: Foreign Key, references `Booking(booking_id)`
  - `amount`: DECIMAL, NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

### 5. **Review**
- **Primary Key**: `review_id` (UUID, Indexed)
- **Attributes**:
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `rating`: INTEGER, CHECK (`rating` >= 1 AND `rating` <= 5), NOT NULL
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 6. **Message**
- **Primary Key**: `message_id` (UUID, Indexed)
- **Attributes**:
  - `sender_id`: Foreign Key, references `User(user_id)`
  - `recipient_id`: Foreign Key, references `User(user_id)`
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships

1. **User ↔ Property**: A `User` (host) can list multiple `Properties` (1:n).
2. **User ↔ Booking**: A `User` (guest) can make multiple `Bookings` (1:n).
3. **Booking ↔ Payment**: Each `Booking` can have one or more `Payments` (1:n).
4. **User ↔ Review**: A `User` can leave multiple `Reviews` for different `Properties` (1:n).
5. **Property ↔ Review**: A `Property` can have multiple `Reviews` from different users (1:n).
6. **User ↔ Message**: A `User` can send messages to another `User`, where each message has a sender and recipient (n:n).

---

## Constraints

### User Table
- **Unique** constraint on `email`.
- **NOT NULL** constraints on required fields (`first_name`, `last_name`, `email`, etc.).

### Property Table
- **Foreign Key** constraint on `host_id`, referencing `User(user_id)`.

### Booking Table
- **Foreign Key** constraints on `property_id` and `user_id`.
- **Enum Constraint**: `status` must be one of (`pending`, `confirmed`, `canceled`).

### Payment Table
- **Foreign Key** constraint on `booking_id`.

### Review Table
- **Foreign Key** constraints on `property_id` and `user_id`.
- **CHECK Constraint**: `rating` must be between 1 and 5.

### Message Table
- **Foreign Key** constraints on `sender_id` and `recipient_id`.

---

## Indexing
- **Primary Keys**: Indexed automatically.
- Additional Indexes:
  - `email` in the `User` table.
  - `property_id` in the `Property` and `Booking` tables.
  - `booking_id` in the `Payment` table.

---

## Notes
- This schema is designed to ensure data consistency, scalability, and efficient querying for the Airbnb-like system.
- The diagram visually represents the relationships and constraints for all entities in the database.

---

## Tools
The ER diagram was created using [Draw.io/Diagrams.net]. You can view or edit the diagram in the provided file.

---
