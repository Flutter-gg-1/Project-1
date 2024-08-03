import 'dart:io';

import 'global_var.dart';

// Function to update employee info
updateEmployee() {
  print("\n Enter employee id to update thir info:");
  int empId = int.parse(stdin.readLineSync()!);
  print("\n What do you want to edit?");
  print("1- Name");
  print("2- Salary");
  print("3- Permissions");
  print("4- Jop descripiton");

  String input = stdin.readLineSync()!;
  Map<String, dynamic> employee = {};
  int count = 0;

  for (var element in employees) {
    if (element["id"] == empId) {
      employee = element;
      break;
    }
    count++;
  }

  switch (input) {
    //update the employee Name
    case "1":
      {
        if (employee.isNotEmpty) {
          print("Enter new name:");
          String? newName = stdin.readLineSync();
          employee["name"] = newName;
          employees[count] = employee;
        } else {
          print('Employee with ID $empId not found.');
        }
      }

      break;

    //update the employee Salary
    case "2":
      {
        if (employee.isNotEmpty) {
          print("Enter new salary:");
          int? newSalary = int.parse(stdin.readLineSync()!);
          employee["salary"] = newSalary;
          employees[count] = employee;
        } else {
          print('Employee with ID $empId not found.');
        }
      }
      break;

    //update the employee Permissions
    case "3":
      {
        if (employee.isNotEmpty) {
          print("Enter new Permissions:");
          String newPermissions = stdin.readLineSync()!;
          employee["Permissions"] = newPermissions;
          employees[count] = employee;
        } else {
          print('Employee with ID $empId not found.');
        }
      }
      break;

    //update the employee Jop descripiton
    case "4":
      {
        if (employee.isNotEmpty) {
          print("Enter new Jop descripiton:");
          String? newjopDescripiton = stdin.readLineSync()!;
          employee["jopDescripiton"] = newjopDescripiton;
          employees[count] = employee;
        } else {
          print('Employee with ID $empId not found.');
        }
      }
      break;
  }
}
