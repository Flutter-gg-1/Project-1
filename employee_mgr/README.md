# Dart Employee Management CLI Application

A Dart-based CLI application to manage employee information within an organization. This application allows users to list and update employee info, and perform basic CRUD operations with privileged access permissions.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Created By](#created-by)

## Features

- Show current user Info
- Edit current user Info
- List all employees with details
- Add a new employee
- Update existing employee information
- Delete an employee
- Privileged access permissions for CRUD operations

## Installation

To install and run this application, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/amer266030/Project-1git
    cd employee_mgr
    ```

2. **Run the application:**

    ```bash
    dart run bin/employee_mgr.dart
    ```

## Usage

### General Info

- The app does not have an implemented authentication mechanism, but it has user selection from a randomly generated user id.
- The app does not have any Data Persistence mechanisms.

### Sign In

The app prompts for user selection by picking a user id from a list of 2 users at app launch. The 'manager' role has full access-rights, where as the 'employee' role has limited access over the functionalities of the app. There is an additional user at first launch that does not show in the list because they are in an 'in-active' state.

```bash
    Id: 49, Name: John Doe, Role: employee
    Id: 168, Name: Charls Legend, Role: manager
    Who are you? Enter your ID to login
 ```

 Entering 49 in the example above will select 'John Doe as the user.

### Viewing Instructions within the app

The Welcome message will ask you to enter 'i' to view instructions to understand basic app commands:

```bash
  -------------------------------------
    * Welcome to FANTASY LAND! *

    Logged in as: John Doe
    Role: employee
    
    Enter 'i' for Instructions
  -------------------------------------
    
i
  ---------------------------------------
    Common Functions:
      my info  | Show my Info
      edit     | Edit my Info
      list emp | List Employees
      signOut  | Sign Out

    Privilaged Functions:
      new emp  | Add New Employee
      edit emp | Edit Existing Employee Details
      del emp  | Delete an Employee
  ---------------------------------------
      q        | Terminate app
  ---------------------------------------
```

using the 'signOut' function will take you back to select another user.

### Privilaged Access Rights

Running Privilaged Functions, as well as editing some restricted fields with an employee role will give an 'Access Denied' message as shown below:

```bash
new emp
🛑 Access Denied! 
You do not have permissions to view the requested data! 🛑
```

Other restricted access for employees are:

* viewing in-active employees.  
* salaries of other employees.

### Data Validation

Data Validation is performed when creating a new employee, and when editing specific fields.

There are 7 fields for each employee that can be added/edited, which are:
- Name (Cannot be Empty)
- Phone (10 digit number)
- Age (number between 10 and 80 inclusive)
- Job Description (Cannot be Empty)
- Salary (number between 500 and 100,000 inclusive)
- Role (Employee, Manager)
- Active State (Active, In-Active)

Wrong Entry Example:
```bash
Edit Details of John Doe. "id#: 120"
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Job Desc.
      5 | Salary
      6 | Role
      7 | Active State

      b | Back to Home

      
1
Access Granted to change the name of John Doe
Enter a new name:

🛑 ERROR: Name Cannot be empty! 🛑
```

For the 'Role', and 'Activity' fields, the app prompts for a selection between the 2 and does not require typing the name.

Selection Example:
```bash
Select an Employee ID to Edit
120
Edit Details of John Doe. "id#: 120"
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Job Desc.
      5 | Salary
      6 | Role
      7 | Active State

      b | Back to Home

      
6
Access Granted to change the role of John Doe
Enter 1 to select Employee, or 2 for Manager
2
New Role selection is manager
```

### Editing other employees

When trying to update or delete other employees, you are prompted to enter the id of the user you wish to perform the functions on. a short list will be printed with all the id's of active and in-active users. 

```bash
-------------------------------------
    * Welcome to FANTASY LAND! *

    Logged in as: Charls Legend
    Role: manager
    
    Enter 'i' for Instructions
  -------------------------------------
    
edit emp
Id: 80, Name: John Doe, Role: employee
Id: 67, Name: Charls Legend, Role: manager
Id: 175, Name: Jack Sparrow, Role: employee
Select an Employee ID to Edit
80
Edit Details of John Doe. "id#: 80"
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Job Desc.
      5 | Salary
      6 | Role
      7 | Active State

      b | Back to Home
```

### Basic Safety Feature

- A user cannot edit some of thier own fields. (Salary, Role, and Active State)
- the current user cannot be deleted.

## Created By

- **Amer Alyusuf**
- [Personal Website](https://amer266030.github.io)
- [LinkedIn](https://www.linkedin.com/in/amer-alyusuf-77398587)
