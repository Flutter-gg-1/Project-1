import 'dart:io';

import './global_variabels.dart';
import './add_new_employee.dart';
import './display_all_employee.dart';
import './update_employee.dart';
import './update_permission.dart';
import './print_with_colors.dart';

class Home {
  static void instruction() {
    PrintWithColors.yellow('''
    |||||||||||||||||||||||||||||||||||||||||||
    1 | Add new employee
    2 | Display all employees
    3 | Update an employee
    4 | Assign permission to an employee
    5 | List all employee
    C | Exit
    |||||||||||||||||||||||||||||||||||||||||||
  
  
  ''');
  }

  static void employeeUpdateList() {
    PrintWithColors.yellow('''

    5 | Update Basic Salary
    6 | Update Job Description
  
  
  ''');
  }

  static void employeeUpdatePermission() {
    PrintWithColors.yellow('''

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
        PrintWithColors.yellow("Please enter employee ID to update :");
        String updateEmployeeID = stdin.readLineSync().toString();
        updateEmployee(employeeID: updateEmployeeID);
        stdin.readLineSync();
        Home.instruction();

      case '4':
        PrintWithColors.yellow("Assign permission to an employee");
        String updateEmployeeID = stdin.readLineSync().toString();
        updateEmployeePermission(employeeID: updateEmployeeID);
        stdin.readLineSync();
        Home.instruction();
      case '5':
        PrintWithColors.yellow("List all employee:");
        print(allEmployee);
        stdin.readLineSync();
        Home.instruction();

      case 'C':
        PrintWithColors.red("Exit");
        isExit = true;

      default:
        isExit = true;
    }
  }
}
