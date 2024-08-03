import 'dart:io';
import 'employees_list.dart';

/*
this function is used for update employee salary,
permissions, and job description using employee ID
*/
dataUpdate({required String? employeeId}) {
  //create map that will contin employee data
  Map<String, dynamic> employee = {};
  //variable
  int count = 0;
  // for loop to find employee account
  for (var element in employeesList) {
    if (element["employee_id"] == employeeId) {
      employee = element;
      break;
    }
    count++;
  }
  /*
  if employee number exists employee data will be printed, 
  then user can select data to update 
  */
  if (employee.isNotEmpty) {
    print("\n");
    print("* Employee name is  ${employee["employee_name"]}");
    print("* Employee ID is  ${employee["employee_id"]}");
    print("* Employee salary is  ${employee["employee_salary"]}");
    print("* Employee permissions is  ${employee["employee_permissions"]}");
    print("* Employee job description is  ${employee["job_description"]}");
    print(
        "__________________________________________________________________\n");

    print("0: Update job description");
    print("1: Update salary");
    print("2: Update permissions");

    String? userInput = stdin.readLineSync();

    if (userInput == "0") {
      print("Enter new job description");
      String? newJopDescription = stdin.readLineSync();
      employee["job_description"] = newJopDescription;
      employeesList[count] = employee;
      print(
          "* Job description updated successfully \n *The new job description is: $newJopDescription");
    } else if (userInput == "1") {
      print("Enter new salary which must be more than 5000");
      String? newSalary = stdin.readLineSync();
      employee["employee_salary"] = newSalary;
      employeesList[count] = employee;
      print("* Salary updated successfully \n *The new salary is: $newSalary");
    } else if (userInput == "2") {
      print(
          "Select new permissions spearated by (,): {Read, Write, Execute or Delete }: ");
      String? newPermissions = stdin.readLineSync();
      employee["employee_permissions"] = newPermissions;
      employeesList[count] = employee;
      print(
          "* Permissions updated successfully \n *The new permissions is: $newPermissions");
    } else {
      print("XXXXX Invalid choice XXXXX");
    }
  } else {
    print("XXXXX Employee ID $employeeId is not found! XXXXX");
  }
  print("Press enter for back to menu");
  stdin.readLineSync();
}
