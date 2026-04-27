# SQL Triggers

This mini project demonstrates how SQL triggers can be used to track and audit changes within an employee database. It focuses on automatically recording modifications to ensure data transparency and accountability.

## Key Components

### 1. Database Setup
The project begins by creating a primary employee table to store employee details, along with a separate audit table designed to capture and log any changes made to the data.

### 2. After Insert Trigger
An AFTER INSERT trigger is implemented to automatically log newly added employee records into the audit table.

### 3. After Delete Trigger
An AFTER DELETE trigger records details of removed employee entries, ensuring that deletions are tracked.

### 4. After Update Trigger
An AFTER UPDATE trigger captures any modifications made to existing employee records and logs them in the audit table for future reference.

## Screenshots

Below are screenshots of the master employee table and the audit table:

<img width="1575" height="488" alt="image" src="https://github.com/user-attachments/assets/20f7fc20-752d-4fc6-b1fd-14dd24779256" />

<img width="1560" height="408" alt="image" src="https://github.com/user-attachments/assets/a5ef350e-c29e-45d0-8972-9a2372fb687b" />

