# Seeding the Database with Sample Data

## Objective
Populate the database with realistic sample data for testing and development purposes. This data includes users, properties, bookings, payments, reviews, and messages to simulate real-world scenarios in an Airbnb-like environment.

---

## Sample Data Overview
The `seed.sql` file contains SQL `INSERT` statements to populate the following tables:

1. **User**:
   - Includes guests, hosts, and admins.
   - Sample fields: `user_id`, `first_name`, `last_name`, `email`, etc.

2. **Property**:
   - Lists properties hosted by users with roles as `host`.
   - Sample fields: `property_id`, `host_id`, `name`, `description`, etc.

3. **Booking**:
   - Contains booking records tied to properties and users.
   - Sample fields: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, etc.

4. **Payment**:
   - Reflects payments made for bookings.
   - Sample fields: `payment_id`, `booking_id`, `amount`, `payment_date`, etc.

5. **Review**:
   - Includes feedback from users about properties.
   - Sample fields: `review_id`, `property_id`, `user_id`, `rating`, `comment`, etc.

6. **Message**:
   - Stores communication between users.
   - Sample fields: `message_id`, `sender_id`, `recipient_id`, `message_body`, etc.

---

## How to Use the Seed Data
### Prerequisites
1. Ensure the database schema is created. Use the `schema.sql` file from the previous task.
2. Verify your database connection settings and access.

### Steps to Seed the Database
1. Save the `seed_data.sql` file to your local system.
2. Execute the file against your database:
   - **MySQL**:
     ```bash
     mysql -u <username> -p <database_name> < seed.sql
     ```
   - **PostgreSQL**:
     ```bash
     psql -U <username> -d <database_name> -f seed.sql
     ```

### Sample Data Highlights
- The data reflects real-world scenarios:
  - Multiple users (guests, hosts, admins).
  - Properties hosted by users with realistic details.
  - Bookings with different statuses (`pending`, `confirmed`).
  - Payments tied to confirmed bookings.
  - Reviews with ratings (1–5) and comments.
  - Messages exchanged between users.

---

## Notes
1. Replace placeholder UUIDs (`uuid1`, `uuid2`, etc.) with valid UUIDs as per your database's requirements.
2. The seed data is for testing and development purposes only. It should not be used in production environments.
3. Review and update the data as needed to suit your application needs.

---