import 'dart:io';                            // library used to interact with user
import 'app_menu.dart';                      // function to print manager's menu
import 'get_input_name.dart';                // function to get name input from user
import 'get_input_salary.dart';              // function to get salary input from user
import 'get_input_job_desc.dart';            // function to get job description input from user
import 'filter_by_name.dart';                // funciton to filter employees by name
import 'filter_by_salary.dart';              // funciton to filter employees by salary
import 'filter_by_permission.dart';          // function to filter employees by permission
import 'filter_by_job_desc.dart';            // function to filter employees by job description

// function to view and filter employees
void viewEmployees({required Map employees}) {
  List filteredEmployees = [];
  while_view:
  while (true) {
    appMenu(mode: 'filter');
    stdout.write("Choose an option : ");
    String? viewChoice = stdin.readLineSync();
    bool filtered = true;
    switch (viewChoice) {
      // back to main menu
      case '0':
        break while_view;

      // view all employees
      case '1':
        for (var employee in employees.values) {
          filteredEmployees.add(employee);
          filtered = false;
        }

      // filter by name
      case '2':
        String inputName = getInputName();
        filteredEmployees = filterByName(name: inputName, employees: employees);

      // filter by salary
      case '3':
        double inputSalary = getInputSalary();
        filteredEmployees = filterBySalary(salary: inputSalary, employees: employees);

      // filter by permission
      case '4':
        stdout.write("Enter a permission : ");
        String? permission = stdin.readLineSync();
        while(permission!.isEmpty || permission.contains(RegExp(r'[a-zA-Z]')) == false) {
          print("ERROR !! : Invalid permission ❌\n");
          stdout.write('Enter a permission : ');
          permission = stdin.readLineSync();
        }
        filteredEmployees = filterByPermission(permission:permission, employees:employees);

      // filter by job description
      case '5':
        String jobDescription = getInputJobDesc();
        filteredEmployees = filterByJobDesc(jobDesc:jobDescription, employees:employees);
    }
    if(filteredEmployees.isEmpty) {
      print("No match found");
      break;
    }
    for(var employee in filteredEmployees) {
      employee.display();
    }
    print("Total${filtered ? ' filtered ' : ' '}employees = ${filteredEmployees.length}\n");
  }
}