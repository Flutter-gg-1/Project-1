// imports
import 'dart:io';                     // library used to interact with user
import 'app_menu.dart';               // function to print app menu
import 'get_input_salary.dart';       // function to get salary input from user
import 'get_input_job_desc.dart';     // function to get job description input from user
import 'get_input_permissions.dart';  // function to get permissions input from user
import 'package:employee_manager/models/employee.dart'; // employee class

void modifyInfo({required int id, required Map<int, Employee> employees}) {
  // get employee instance with the specified id
  Employee employee = employees[id]!;
  while_modify:
  while (true) {
    print('What modification do you want to perform on employee $id ?');
    appMenu(modify:true);
    stdout.write("Choose an option : ");
    String? modifyChoice = stdin.readLineSync();

    switch (modifyChoice) {
      // back to main menu
      case '0':
        break while_modify;

      // modify salary
      case '1':
        employee.salary = getInputSalary();
        print("Salary is updated successfully ✅\n");

      // modify job description
      case '2':
        employee.jobDesc = getInputJobDesc();
        print("Job description is updated successfully ✅\n");

      // add permission if possible
      case '3':
        if (employee.permissions.isEmpty) {
          employee.permissions = getInputPermissions(name: employee.name);
          print("Permissions are updated successfully ✅\n");
        }
        else if (employee.permissions.length == 3) {
          print("ERROR !! : Employee $id has maximum amount of permissions ❌\n");
        }
        else {
          stdout.write("Enter a permission : ");
          String? permission = stdin.readLineSync();
          employee.permissions.add(permission);
          print("Permission added successfully ✅\n");
        }

      // remove permission if possible
      case '4':
        if (employee.permissions.isNotEmpty) {
          print('current permissions : ');
          employee.getPermissions();
          stdout.write("Enter a permission number to remove : ");
          String? index = stdin.readLineSync();
          /*
            index validation :
              1- shouldn't be empty
              2- should be either 1,2,or 3
              3- shouldn't be more than the permissions list length
          */
          while(index!.isEmpty || ['1','2','3'].contains(index) == false || int.parse(index)>employee.permissions.length) {
            print("ERROR !! : Invalid input ❌\n");
            stdout.write("Enter a permission number to remove : ");
            index = stdin.readLineSync();
          }
          employee.permissions.removeAt(int.parse(index)-1);
          print("Permission removed successfully ✅\n");
        }
        else {
          print("ERROR !! : Employee $id has no permissions ❌\n");
        }
    }
  }
}