import 'dart:io';

import 'print_with_color.dart';
/*
    This function for listing all employees
*/
listAllEmployees({required List<dynamic> employeelist}) {
  const featureName = "List of employees:";
  printWithColor(text: "\t\t$featureName", color: 'Blue');
  //  iterate for each employee in list and show thier data
  for (var element in employeelist) {
    print("\nName: ${element["name"]}");
    print("ID: ${element["id"]}");
    print("Phone number: ${element["phone"]}");
    print("Salary: ${element["salary"]}");
    print("Permission: ${element["permission"]}");
    print("Job Description: ${element["jobDescription"]}");
    print("-------------------------------");
    print('\n');
  }
  if(employeelist.isEmpty){
    printWithColor(text: "\nNo employee is present.", color: "Red");
  }
  printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
  stdin.readLineSync();
}
