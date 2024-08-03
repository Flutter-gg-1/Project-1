// imports
import 'dart:io';             // library used to interact with user
import 'app_menu.dart';       // function to print manager's menu
import 'add_employee.dart';   // function to add a new employee
import 'get_input_id.dart';   // function to get id input from user
import 'modify_info.dart';    // function to modify employee info
import 'view_employees.dart'; // function to view and filter employees
import 'package:employee_manager/models/employee.dart'; // employee class

void main() {
  // initialize map of employees ids as key and employees instances as values
  Map<int,Employee> employees = {};
  while_manage:
  while(true) {
    appMenu(mode: 'main');
    stdout.write("Choose an option : ");
    var option = stdin.readLineSync();
    if(['1','3','4','5'].contains(option) & employees.isEmpty) {
      print("ERROR !! : You have not added any employees yet ❌\n");
      continue;
    }
    switch(option) {
      // EXIT
      case '0' :
        print("good bye ...");
        break while_manage;

      // view employees
      case '1' :
        viewEmployees(employees: employees);

      // add employee
      case '2' :
        List employeeInfo = addEmployee(employees: employees);
        int id = employeeInfo[0];
        Employee employee = employeeInfo[1];
        employees[id] = employee;
        print("Employee ${employee.name} is added to the company ✅\n${employee.name}'s ID is $id\n");

      // promote an employee
      case '3' :
        int id = getInputID(employees);
        employees[id]!.promote();

      // modify employee info
      case '4':
        int id = getInputID(employees);
        modifyInfo(id: id, employees: employees);

      // remove employee
      case '5':
        int id = getInputID(employees);
        employees.remove(id);
        print("Employee $id is removed successfully ✅\n");

      // any else input
      default : print("ERROR !! : Invalid choice ❌\n");
    }
  }
}