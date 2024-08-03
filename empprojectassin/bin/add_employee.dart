import 'dart:io';
import 'dart:math';
import 'data_list.dart';

addEmployee({required String name}) {
  String empID = "${Random().nextInt(10)}${Random().nextInt(20)}";
  String empName = name;
  print('Salary: ');
  double salary = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> employeesAddMap = {
    "empID": empID,
    "empName": empName,
    "salary": salary,
    "permissions": '',
    "description": '',
  };
  empData.add(employeesAddMap);
  print("Employee is added");
  stdin.readLineSync();
}
