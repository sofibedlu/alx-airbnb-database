# SQL Joins Queries

## Objective
This task involves writing SQL queries to retrieve data from a relational database using various types of joins.

## File: `joins_queries.sql`
The `joins_queries.sql` file contains SQL queries that demonstrate the use of different join operations to fetch data from multiple tables.

### Queries Included

1. **Inner Join Example**
   ```sql
   SELECT 
       table1.column1,
       table1.column2,
       table2.column3
   FROM 
       table1
   INNER JOIN 
       table2
   ON 
       table1.common_column = table2.common_column;

- Description: This query retrieves data from table1 and table2 where there is a matching value in the common_column.
---

2. **Left Join Example**
   ```sql
   SELECT 
    table1.column1,
    table1.column2,
    table2.column3
    FROM 
        table1
    LEFT JOIN 
        table2
    ON 
        table1.common_column = table2.common_column;

- Description: This query fetches all records from table1 and the matched records from table2. Unmatched records from table1 will still appear with NULL values for columns from table2.
---

3. **Full Outer Join Example**
    ```sql
    SELECT 
        table1.column1,
        table1.column2,
        table2.column3
    FROM 
        table1
    FULL OUTER JOIN 
        table2
    ON 
        table1.common_column = table2.common_column;

- Description: This query retrieves all records when there is a match in either table1 or table2. Records that do not match will have NULL values for columns from the other table.
---

## How to Run the Queries
1. Ensure you have access to the database with the required schema and data.
2. Open your preferred SQL client or command-line tool.
3. Execute the queries in the joins_queries.sql file.

---

## Notes
1. These queries are designed to work with a generic relational database schema.
2. Modify the queries as needed to suit your specific database setup and requirements.
3. MySQL does not natively support FULL OUTER JOIN. To achieve similar functionality, you can use a combination of LEFT JOIN and RIGHT JOIN with a UNION

---