import 'dart:io';
import 'dart:math';
import 'print_with_color.dart';
/*
    This Function is to add new employee
*/

// list for storing each employee and their data
List<dynamic> employees = [];
addEmplyee() {
  // collect data from user
  print("Employee name: ");
  String name = stdin.readLineSync()!;
  final id = Random().nextInt(9999999);
  print("Employee phone number: ");
  String? phone = stdin.readLineSync()!;
  print("Employee permission: ");
  String permission = stdin.readLineSync()!;
  double salary = 0.0;
  /*

  -------------Determine salary by permission-------------

  if employee's permissin = admin 
   ------salary = 12000-------

  or if employee's permission = manager 
    -------salary = 10000-------

  or if employee's permission = employee
      ------salary = 80000------
  
  */
  if (permission == 'Admin' || permission == "admin") {
    salary = 12000;
    print("Employee Salary: $salary");
  } else if (permission == "Manager" || permission == "manager") {
    salary = 10000;
    print("Employee Salary: $salary ");
  } else {
    salary = 8000;
    print("Employee Salary: $salary");
  }
  print("Employee description: ");
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
