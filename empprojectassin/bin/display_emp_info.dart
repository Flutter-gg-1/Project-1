import 'dart:io';
import 'colors.dart';

//display Employee information
displayInfo({required List<Map<String, dynamic>> displayListInfo}) {
  if (displayListInfo.isNotEmpty) {
    for (var element in displayListInfo) {
      print("-------------------------------");
      print("Employee ID: ${element["empID"]}");
      print("Employee Name: ${element["empName"]}");
      print("Employee Salary: ${element["salary"]}");
      print("Employee Permissions: ${element["permissions"]}");
      print("Employee Job Description: ${element["description"]}");
      print("-------------------------------");
    }
    stdin.readLineSync();
  } else {
    print('$redBG there is no Employees\x1B[0m');
  }
}
