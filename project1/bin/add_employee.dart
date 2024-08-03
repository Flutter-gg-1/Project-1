import 'dart:io';
import 'dart:math';
import 'print_with_color.dart';
/*
    This Function is to add new employee
*/

// list for storing each employee and their data
List<dynamic> employees = [];
const permssionList = ["read", "write", "execute"];
addEmplyee() {
  // collect data from user
  print("Employee name: ");
  String name = stdin.readLineSync()!;
  final id = Random().nextInt(9999999);
  print("Employee phone number: ");
  String? phone = stdin.readLineSync()!;
  print("Employee permission: $permssionList");
  String permission = stdin.readLineSync()!;
  /*
     checking if salary between 3000 and 15000
  */
  print("Salary: ");
  double salary = double.parse(stdin.readLineSync()!);
  if(salary < 3000 || salary >= 150000){
    printWithColor(text: "The salary must be between 3000 and 15000 " , color: "Red");
    print("Salary: ");
    salary = double.parse(stdin.readLineSync()!);
  }
  print("Employee job description: ");
  String jobDescription = stdin.readLineSync()!;
// map for storing emloyee's data
  Map<String, dynamic> employeesMap = {
    "name": name,
    "id": id,
    "phone": phone,
    "salary": salary,
    "permission": permission,
    "jobDescription": jobDescription
  };
// adding employee's data to list
  employees.add(employeesMap);
  printWithColor(text: "\nEmployee added successfuly", color: "Green");
  printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
  stdin.readLineSync();
}
