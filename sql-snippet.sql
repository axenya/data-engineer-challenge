CREATE TABLE employees (
                           employee_id INT PRIMARY KEY,
                           department_id INT,
                           document VARCHAR(11),
                           first_name VARCHAR(50),
                           last_name VARCHAR(50),
                           salary DECIMAL(10, 2),
                           hire_date DATE
);

CREATE TABLE departments (
                             department_id INT PRIMARY KEY,
                             department_name VARCHAR(50)
);

CREATE TABLE projects (
                          project_id INT PRIMARY KEY,
                          department_id INT,
                          project_name VARCHAR(50)
);

CREATE TABLE project_assignments (
                                     assignment_id INT PRIMARY KEY,
                                     project_id INT,
                                     employee_id INT,
                                     hours_worked INT
);

SELECT
    d.department_name,
    SUM(pa.hours_worked) AS total_hours,
    AVG(e.salary) AS average_salary
FROM
    departments d
        JOIN
    employees e ON d.department_id = e.department_id
        JOIN
    project_assignments pa ON e.employee_id = pa.employee_id
        JOIN
    projects p ON pa.project_id = p.project_id
WHERE
        e.hire_date > '2020-01-01'
GROUP BY
    d.department_name
ORDER BY
    d.department_name;
