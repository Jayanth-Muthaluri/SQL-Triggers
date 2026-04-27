-- Triggers Project

-- Selecting Database
use practice;


-- Creating Master Table
create table master_employee
(
	m_id int primary key,
    name varchar (50),
    age int,
    salary float,
    department varchar (50)
);

-- Inserting records into the table
INSERT INTO master_employee (m_id, name, age, salary, department)
VALUES
(1, 'John Doe', 28, 55000.00, 'HR'),
(2, 'Jane Smith', 32, 60000.00, 'Marketing'),
(3, 'Michael Johnson', 35, 75000.00, 'Sales'),
(4, 'Emily Davis', 26, 48000.00, 'Finance'),
(5, 'David Wilson', 30, 58000.00, 'IT'),
(6, 'Sarah Thompson', 29, 52000.00, 'HR'),
(7, 'Christopher Lee', 31, 59000.00, 'Marketing'),
(8, 'Amanda White', 34, 72000.00, 'Sales'),
(9, 'Matthew Turner', 27, 49000.00, 'Finance'),
(10, 'Olivia Harris', 33, 61000.00, 'IT'),
(11, 'William Martin', 29, 55000.00, 'HR'),
(12, 'Sophia Martinez', 28, 57000.00, 'Marketing'),
(13, 'Daniel Jackson', 36, 76000.00, 'Sales'),
(14, 'Emma Taylor', 27, 48000.00, 'Finance'),
(15, 'Joseph Anderson', 31, 59000.00, 'IT'),
(16, 'Mia Lopez', 30, 54000.00, 'HR'),
(17, 'James Baker', 35, 72000.00, 'Marketing'),
(18, 'Abigail Hall', 32, 63000.00, 'Sales'),
(19, 'Benjamin Garcia', 29, 52000.00, 'Finance'),
(20, 'Ella Clark', 33, 60000.00, 'IT');

-- Creating table for logging
create table employee_audit
(	a_id int primary key auto_increment,
	m_id int ,
    name varchar (50),
    age int,
    salary float,
    department varchar (50),
    operation varchar (50),
    operation_time timestamp default now(), 
    operation_description varchar (6000) );


-- Creating After Insert Trigger

delimiter $$
create trigger audit_insert 
after insert
on master_employee
for each row
begin
insert into employee_audit (m_id, name, age, salary, department, operation, operation_description)
values (NEW.m_id, NEW.name, NEW.age, NEW.salary, NEW.department, "INSERT", "Record Was Added");
END $$

delimiter ;

-- Checking
insert into master_employee 
values (21, 'GB', 21, 60000000.00, 'IT');

select * from master_employee;
select * from employee_audit;

-- Creating After Delete Trigger

delimiter $$
create trigger audit_delete
after delete
on master_employee 
for each row
begin
insert into employee_audit (m_id, name, age, salary, department, operation, operation_description)
values (OLD.m_id, OLD.name, OLD.age, OLD.salary, OLD.department, "DELETE", "Record Was Deleted");
END $$
 
delimiter ;

-- Checking
delete from master_employee 
where m_id = 13;

select * from master_employee;
select * from employee_audit;


-- Creating a After Update Trigger

DELIMITER $$

CREATE TRIGGER audit_update
AFTER UPDATE
ON master_employee 
FOR EACH ROW
BEGIN
    DECLARE changes VARCHAR(500);

    SET changes = '';

    IF OLD.name != NEW.name THEN 
        SET changes = CONCAT(changes, 'Name was changed from ', OLD.name, ' to ', NEW.name );
    END IF;

    IF OLD.age != NEW.age THEN
        SET changes = CONCAT(changes, 'Age was changed from ', OLD.age, ' to ', NEW.age );
    END IF;

    IF OLD.salary != NEW.salary THEN
        SET changes = CONCAT(changes, 'Salary was changed from ', OLD.salary, ' to ', NEW.salary );
    END IF;

    IF OLD.department != NEW.department THEN
        SET changes = CONCAT(changes, 'Department was changed from ', OLD.department, ' to ', NEW.department );
    END IF;

    IF LENGTH(changes) > 0 THEN
        INSERT INTO employee_audit (m_id, name, age, salary, department, operation, operation_description)
        VALUES (NEW.m_id, NEW.name, NEW.age, NEW.salary, NEW.department, 'UPDATE', changes);
    END IF;
END $$

DELIMITER ;


-- Checking
UPDATE master_employee
SET name = 'Rahul', age = 32, salary = 650000.00, department = 'IT'
WHERE m_id = 3;

select * from master_employee;
select * from employee_audit;


