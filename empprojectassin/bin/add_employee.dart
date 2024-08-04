import 'dart:io';
import 'dart:math';
import 'data_list.dart';
import 'pannel_emp.dart';

//add employee
addEmployee({required String name}) {
  //final ID
  final empID = "${Random().nextInt(10)}${Random().nextInt(20)}";
  //name Employee
  String empName = name;
  //Salary Employee
  print('Salary: ');
  double salary = double.parse(stdin.readLineSync()!);
  //Job Description Employee
  print('Job Description: ');
  var empDesc = stdin.readLineSync()!;
  //display permissions pannel
  permissionsPannel();
  String permission = stdin.readLineSync()!;
  switch (permission) {
    case '0':
      permission = 'admin';
      break;
    case '1':
      permission = 'Assistant';
      break;
    case '2':
      permission = 'Employeer';
    default:
  }
  Map<String, dynamic> employeesAddMap = {
    "empID": empID,
    "empName": empName,
    "salary": salary,
    "permissions": permission,
    "description": empDesc,
  };
  empData.add(employeesAddMap);
  print("Employee is added");
  stdin.readLineSync();
}
