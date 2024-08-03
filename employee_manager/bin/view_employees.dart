import 'dart:io';                     // library used to interact with user
import 'app_menu.dart';               // function to print manager's menu
import 'get_input_name.dart';         // function to get name input from user
import 'get_input_salary.dart';       // function to get salary input from user
import 'get_input_job_desc.dart';     // function to get job description input from user
import 'get_input_permissions.dart';  // function to get permissions input from user
import 'package:employee_manager/models/employee.dart'; // employee class

// function to view and filter employees
void viewEmployees({required Map employees}) {
  while_view:
  while(true) {
    appMenu(mode:'filter');
    stdout.write("Choose an option : ");
    String? viewChoice = stdin.readLineSync();
    switch(viewChoice) {
      // back to main menu
      case '0' :
        break while_view;

      // view all employees
      case '1' :
        for(var employee in employees.values) {
          employee.display();
        }
        print('Total Employees = ${employees.length}');

      // filter by name
      case '2' :

      // filter by salary
      case '3' :

      // filter by permission
      case '4' :

      // filter by job description
      case '5' :

    }
  }
}