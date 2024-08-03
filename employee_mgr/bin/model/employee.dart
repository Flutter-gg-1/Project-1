import 'dart:math';

import 'enums/employee_role.dart';
import 'enums/employee_status.dart';

class Employee {
  static const companyName = 'FANTASY LAND';
  int id = Random().nextInt(200);
  String name;
  int phoneNum;
  int age;
  double salary;
  EmployeeStatus status;
  // Employee Role is used for permissions and Access Rights
  EmployeeRole role;

  Employee(
      {required this.name,
      required this.phoneNum,
      required this.age,
      required this.salary,
      this.role = EmployeeRole.employee,
      this.status = EmployeeStatus.active});

  String salaryStr() => salary.toStringAsFixed(2);
  String phoneStr() {
    var str = phoneNum.toString();
    return '${str.substring(1, 4)} ${str.substring(4, 8)}';
  }

  bool hasAccess() => role == EmployeeRole.manager;

  void showEmployeeDeatails() {
    print('''
    \x1B[34m-----------------------------------\x1B[0m
    Company:\x1B[32m  $companyName      \x1B[0m
    Id:     \x1B[32m  $id               \x1B[0m
    Name:   \x1B[32m  $name             \x1B[0m
    Phone:  \x1B[32m  ${phoneStr()}     \x1B[0m
    Age:    \x1B[32m  $age              \x1B[0m
    Salary: \x1B[32m  ${salaryStr()}    \x1B[0m
    Role:   \x1B[32m  ${role.name}      \x1B[0m
    Status: \x1B[32m  ${status.name}      \x1B[0m
    \x1B[34m-----------------------------------\x1B[0m
    ''');
  }
}
