import 'dart:io';

import 'global_var.dart';

//function to dispaly employees
displayEmployee() {
  print("\n\n");
  print("1- Display all employees");
  print("2- Display by ID");
  String input = stdin.readLineSync()!;
  if (input == "1") {
    for (var element in employees) {
      print("-------------------------------");
      print("ID: ${element["id"]}");
      print("Name: ${element["name"]}");
      print("Salary: ${element["salary"]}");
      print("Permissions: ${element["permissions"]}");
      print("Jop descripiton: ${element["jopDescripiton"]}");
      print("-------------------------------");
      print('\n');
    }
  } else if (input == "2") {
    print("\nAdd employee ID to display");
    int inputId = int.parse(stdin.readLineSync()!);
    for (var element in employees) {
      if (element["id"] == inputId) {
        print("-------------------------------");
        print("ID: ${element["id"]}");
        print("Name: ${element["name"]}");
        print("Salary: ${element["salary"]}");
        print("Permissions: ${element["permissions"]}");
        print("Jop descripiton: ${element["jopDescripiton"]}");
        print("-------------------------------");
        print('\n');
      } else {
        print('Employee with ID $inputId not found.');
      }
    }
  }
}
