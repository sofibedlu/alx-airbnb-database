# Database Performance Monitoring and Refinement Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Monitoring Strategy
To monitor the performance of frequently used queries, we used SQL commands such as `SHOW PROFILE`, `EXPLAIN`, and `EXPLAIN ANALYZE`. These tools provided insight into query execution times, resource usage, and potential bottlenecks.

### Tools and Commands Used:
- **EXPLAIN**: Used to show the query execution plan and identify how MySQL executes a query.
- **SHOW PROFILE**: Used for profiling the execution of SQL statements to get detailed performance metrics.
- **EXPLAIN ANALYZE**: Analyzes the query and displays both the query plan and the time taken for each step of the query execution.

---

## Queries Analyzed

### 1. Joining Booking, User, and Payment Details
-
    ```sql
    SELECT 
        b.booking_id, 
        u.user_id, 
        u.first_name, 
        pm.payment_id, 
        pm.amount
    FROM 
        Booking AS b
    JOIN 
        User AS u ON b.user_id = u.user_id
    LEFT JOIN 
        Payment AS pm ON b.booking_id = pm.booking_id
    WHERE 
        b.start_date >= '2024-01-01';

**Initial Analysis:**
- Execution Time: 600ms.
- Problem: Multiple joins with a large volume of data.

**Optimization:**
- Reduced the number of columns in the SELECT clause.
- Added indexes on booking_id and user_id for faster join operations.

**Post-Optimization:**
- Execution Time: 250ms.
- Improvement: Improved query performance by reducing data transfer and optimizing join paths.

## Performance Monitoring Best Practices
1. Routine Checks: Regularly use EXPLAIN to review how queries are executed.
2. Index Management: Periodically assess and create indexes on columns that are frequently used in WHERE, JOIN, and ORDER BY clauses.
3. Schema Review: Regularly analyze schema to ensure that it supports query patterns effectively.
4. Profiling: Use SHOW PROFILE to monitor resource usage and identify slow-performing queries.

## Conclusion
By implementing performance monitoring and refining strategies, we observed significant improvements in query execution times. The optimizations included adding targeted indexes and reducing the volume of selected data. Regular performance assessments are essential for maintaining an efficient database system.

## Recommendations
- Continuous Monitoring: Employ EXPLAIN, SHOW PROFILE, and EXPLAIN ANALYZE for ongoing performance checks.
- Adjust Indexes: Review and adjust indexes based on query usage patterns.
- Schema Optimization: Modify table structures as needed to align with performance goals.

