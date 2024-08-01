// imports
import 'dart:io';             // library to interact with user
import 'manager_menu.dart';   // function to print manager's menu
import 'add_employee.dart';   // function to add a new employee
import 'package:employee_manager/models/employee.dart'; // employee class

void main() {
  // initialize list of employees
  List employees = [];
  while_manage:
  while(true) {
    managerMenu();
    stdout.write("Choose an option : ");
    String? action = stdin.readLineSync();
    switch(action) {
      // EXIT
      case '0' :
      print("good bye ...");
      break while_manage;

      case '1' :
      // view employees

      // add employee
      case '2' :
      Employee employee = addEmployee();
      employees.add(employee);
      print("Employee ${employee.name} is added to employees list ✅");

      case '3' :
      // modify employee info

      case '4' :
      // remove employee

      default :
      print("ERROR !! : Invalid choice\n");
    }
  }
}