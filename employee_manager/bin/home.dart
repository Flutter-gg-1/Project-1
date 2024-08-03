import 'dart:io';

import './global_variabels.dart';
import './add_new_employee.dart';
import './display_all_employee.dart';
import './update_employee.dart';
import './update_permission.dart';

class Home {
  static void instruction() {
    print('''

    1 | Add new employee
    2 | Display all employees
    3 | Update an employee
    4 | Assign permission to an employee
    5 | List all employee
    C | Exit
  
  
  ''');
  }

  static void employeeUpdateList() {
    print('''

    5 | Update Basic Salary
    6 | Update Job Description
  
  
  ''');
  }

  static void employeeUpdatePermission() {
    print('''

    1 | ${empPermission[0]}
    2 | ${empPermission[1]}
  
  
  ''');
  }

  static void userInput(String str) {
    switch (str) {
      case '1':
        inputNewEmployee();
      case '2':
        displayAllEmployee(allEmployee);
        stdin.readLineSync();
        Home.instruction();
      case '3':
        print("Update an employee");
        String updateEmployeeID = stdin.readLineSync().toString();
        updateEmployee(employeeID: updateEmployeeID);
        stdin.readLineSync();
        Home.instruction();

      case '4':
        print("Assign permission to an employee");
        String updateEmployeeID = stdin.readLineSync().toString();
        updateEmployeePermission(employeeID: updateEmployeeID);
        stdin.readLineSync();
        Home.instruction();
      case '5':
        print("List all employee:");
        print(allEmployee);
        stdin.readLineSync();
        Home.instruction();

      case 'C':
        print("Exit");
        isExit = true;

      default:
        isExit = true;
    }
  }
}
