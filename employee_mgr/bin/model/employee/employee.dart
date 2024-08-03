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
  EmployeeStatus state;
  // Employee Role is used for permissions and Access Rights
  EmployeeRole role;

  Employee(
      {required this.name,
      required this.phoneNum,
      required this.age,
      required this.salary,
      this.role = EmployeeRole.employee,
      this.state = EmployeeStatus.active});

  String salaryStr() => '${salary.toStringAsFixed(2)} SAR';
  String phoneStr() {
    var str = phoneNum.toString();
    String formattedPhone =
        '${str.substring(0, 3)} ${str.substring(3, 6)}-${str.substring(6, 10)}';
    return formattedPhone;
  }

  bool hasAccess() => role == EmployeeRole.manager;

  void showEmployeeDeatails({bool fullAccess = false, bool short = true}) {
    short ? shortPrint() : detailedPrint(fullAccess);
  }

  void detailedPrint(bool fullAccess) {
    print('''
    \x1B[34m-----------------------------------\x1B[0m
    Company:\x1B[32m  $companyName      \x1B[0m
    Id:     \x1B[32m  $id               \x1B[0m
    Name:   \x1B[32m  $name             \x1B[0m
    Phone:  \x1B[32m  ${phoneStr()}     \x1B[0m
    Age:    \x1B[32m  $age              \x1B[0m
    Salary: \x1B[32m  ${fullAccess ? salaryStr() : '**'}    \x1B[0m
    Role:   \x1B[32m  ${role.name}      \x1B[0m
    Status: \x1B[32m  ${fullAccess ? state.name : '**'}      \x1B[0m
    \x1B[34m-----------------------------------\x1B[0m
    ''');
  }

  void shortPrint() {
    print('Id: \x1B[32m$id\x1B[0m, Name: \x1B[32m$name\x1B[0m');
  }
}
