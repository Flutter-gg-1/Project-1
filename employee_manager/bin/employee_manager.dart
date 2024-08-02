// imports
import 'dart:io';             // library used to interact with user
import 'manager_menu.dart';   // function to print manager's menu
import 'add_employee.dart';   // function to add a new employee
import 'package:employee_manager/models/employee.dart'; // employee class

void main() {
  // initialize map of employees ids as key and employees instances as values
  Map<int,Employee> employees = {};
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
      if(employees.isEmpty) {
        print("You have not added any employees yet");
        break;
      }
      for(var emp in employees.values) {
        emp.display();
      }
      print("\nTotal employees : ${employees.length}");

      // add employee
      case '2' :
      List employeeInfo = addEmployee(employees: employees);
      int id = employeeInfo[0];
      Employee employee = employeeInfo[1];
      employees[id] = employee;
      print("Employee ${employee.name} is added to employees list ✅\n${employee.name}'s ID is $id");

      case '3' :
      // modify employee info

      case '4' :
      // remove employee

      default :
      print("ERROR !! : Invalid choice\n");
    }
  }
}