# Database Normalization Report

This document provides an overview of the normalization process applied to the AirBnB-like database schema, ensuring that all tables are normalized to the Third Normal Form (3NF).

---

## **Normalization Steps**

### **1. User Table**
- **1NF**: The table contains atomic attributes such as `first_name`, `last_name`, `email`, etc., with a unique identifier (`user_id`).
- **2NF**: All non-key attributes are fully dependent on the primary key (`user_id`).
- **3NF**: No transitive dependencies exist. For example, `email` and `role` depend directly on `user_id`, not on other attributes.

**No changes needed.**

---

### **2. Property Table**
- **1NF**: The table contains atomic attributes such as `name`, `description`, `location`, etc., with a unique identifier (`property_id`).
- **2NF**: Attributes like `name` and `location` are fully dependent on the primary key (`property_id`).
- **3NF**: No transitive dependencies exist. For example, `host_id` links to the `User` table but does not cause transitive dependencies.

**No changes needed.**

---

### **3. Booking Table**
- **1NF**: Each record represents a unique booking, with attributes like `start_date` and `end_date` being atomic.
- **2NF**: All non-key attributes (e.g., `start_date`, `status`) depend fully on the primary key (`booking_id`).
- **3NF**: No transitive dependencies exist.

**No changes needed.**

---

### **4. Payment Table**
- **1NF**: Each payment is represented uniquely with atomic attributes like `amount` and `payment_date`.
- **2NF**: All attributes depend fully on the primary key (`payment_id`).
- **3NF**: No transitive dependencies exist. The `booking_id` foreign key ensures the payment is linked to a valid booking without redundancy.

**No changes needed.**

---

### **5. Review Table**
- **1NF**: Each review has a unique identifier (`review_id`), and attributes like `rating` and `comment` are atomic.
- **2NF**: All attributes depend fully on the primary key (`review_id`).
- **3NF**: No transitive dependencies exist.

**No changes needed.**

---

### **6. Message Table**
- **1NF**: The table satisfies 1NF; all attributes are atomic, and each message has a unique identifier (`message_id`).
- **2NF**: All attributes depend fully on the primary key (`message_id`).
- **3NF**: No transitive dependencies exist.

**No changes needed.**

---

## **Final Database Normalization Summary**
All tables in the schema have been normalized to 3NF:
- Redundant data has been removed.
- Data integrity has been improved.
- Relationships between entities are maintained with foreign keys.

The current structure ensures scalability, consistency, and optimized query performance.

---
