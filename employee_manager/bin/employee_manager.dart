// imports
import 'dart:io';             // library to interact with user
import 'manager_menu.dart';   // function to print manager's menu
import 'add_employee.dart';   // function to add a new employee
import 'package:employee_manager/models/employee.dart'; // employee class

void main() {
  // initialize list of employees
  List<Employee> employees = [];
  while_manage:
  while(true) {
    managerMenu();
    stdout.write("Choose an option : ");
    var action = stdin.readLineSync();
    switch(action) {
      // EXIT
      case '0' :
      print("good bye ...");
      break while_manage;

      // view employees
      case '1' :
      for(var emp in employees) {
        emp.display();
      }

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