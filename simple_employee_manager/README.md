<p align="center">
<img src="./assets/logo-h.png" alt="Tuwaiq" width="400"/>

# Simple employee manager

## Objective:
 **A user-friendly application for managing employees** that provides a range of features, including:

- Adding new employees.
- Assigning permissions.
- Displaying employee data.
- Listing all employees and their key details.
- Modifying employee salaries, permissions, and job descriptions.

## How does it work?
#### 1. In terminal write `dart run` to start.
 **Menu:**
<p align="center">
<img src="./assets/home.png" width="400"/>

 


#### 2. Enter number of opration you want to perform:
  - you can use **"add a new employee"** function: to add a new employee by entring employee name, employee jop description, set employee salary that must exceed 5000, and specify at least one permission from a set by entering permissions separated by commas (,).
   **example:** 
  <p align="center">
  <img src="./assets/add-employee.png" width="500"/>


  - To display employee data by employee ID use **"display employee data"** function that will display employee data like employee name, employee ID, employee job description, employee salary, employee permission, employee start date, and employee work days. 
  **example:** 
   <p align="center">
   <img src="./assets/display-employee.png" width="300"/>

  - To update data by employee ID use **"updat salary ,permissions, and job description"** function which help in update job description, set employee salary that must exceed 5000, or specify at least one permission from a set by entering permissions separated by commas (,).**examples:** 
  <p align="center">
  <img src="./assets/update-job-description.png" width="400"/>


  <p align="center">
  <img src="./assets/update-salary.png" width="400"/>

<p align="center">
  <img src="./assets/update-permissions.png" width="400"/>



  - Selecting **"List All Employees"** function will display all employees along with their key details, and will also show the total number of employees in the system.
  **example:** 
  <p align="center">
  <img src="./assets/display-employee.png" width="300"/>


#### 3. for exit enter `Q` or `q`

 
## Guidelines: 
- in **"add a new employee"** if you did not enter employee name, and job description it will appear as empty.**example with output:** 
<p align="center">
<img src="./assets/null-naming.png" width="500"/>
<p align="center">
<img src="./assets/null-naming-output.png" width="400"/>


- in **"add a new employee"** if you enter salary less than 5000 it will print (Salary must be more than 5000) massage. **example:** 
<p align="center">
<img src="./assets/salary-and-permission-error.png" width="500"/>

- in **"add a new employee"** if you did not enter permission it will prent (At least one permission must be selected) massage.
**examples:** 
<p align="center">
<img src="./assets/salary-and-permission-error.png" width="500"/>

- in **"add a new employee"** if you enter permission not in the set it will print (Invalid permission: ) massage. **examples:** 
<p align="center">
<img src="./assets/invalid-permission.png" width="500"/>


- in **"display employee data"** and **"Updat salary ,permissions, and job description"** if you enter wrong employee ID it will print (Employee ID is not found!) massage. **examples:** 
<p align="center">
<img src="./assets/id-not-found.png" width="300"/>


## Bulit with: 
Dart language

