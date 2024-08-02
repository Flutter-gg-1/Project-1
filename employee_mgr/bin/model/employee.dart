import 'dart:math';

import '../utils/colorful_print.dart';
import 'employee_role.dart';

class Employee {
  static const companyName = '* Fantasy Land *';
  int id = Random().nextInt(200);
  String name;
  int phoneNum;
  int age;
  double salary;
  // Employee Role is used for permissions and Access Rights
  EmployeeRole role;

  Employee(
      {required this.name,
      required this.phoneNum,
      required this.age,
      required this.salary,
      this.role = EmployeeRole.employee});

  String salaryStr() => salary.toStringAsFixed(2);
  String phoneStr() {
    var str = phoneNum.toString();
    return '${str.substring(1, 4)} ${str.substring(4, 8)}';
  }

  bool hasAccess() => role == EmployeeRole.manager;

  void showEmployeeDeatails() {
    ColorfulPrint.blue('''
      -----------------------------------------
      Id:     \x1B[30m  $id            \x1B[0m
      Name:   \x1B[30m  $name          \x1B[0m
      Phone:  \x1B[30m  $phoneStr()    \x1B[0m
      Age:    \x1B[30m  $age           \x1B[0m
      Salary: \x1B[30m  $salaryStr()   \x1B[0m
      Role:   \x1B[30m  ${role.name}   \x1B[0m
      -----------------------------------------
      ''');
  }
}
