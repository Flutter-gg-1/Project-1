import 'dart:io';
import 'dart:math';

import '../utils/colorful_print.dart';
import 'enums/employee_role.dart';
import 'enums/employee_status.dart';

class Employee {
  static const companyName = '* Fantasy Land *';
  int id = Random().nextInt(200);
  String name;
  int phoneNum;
  int age;
  double salary;
  EmployeeStatus status = EmployeeStatus.active;
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
    print('''
    \x1B[34m-----------------------------------\x1B[0m
    Id:     \x1B[32m  $id               \x1B[0m
    Name:   \x1B[32m  $name             \x1B[0m
    Phone:  \x1B[32m  ${phoneStr()}     \x1B[0m
    Age:    \x1B[32m  $age              \x1B[0m
    Salary: \x1B[32m  ${salaryStr()}    \x1B[0m
    Role:   \x1B[32m  ${role.name}      \x1B[0m
    Status: \x1B[32m  ${role.name}      \x1B[0m
    \x1B[34m-----------------------------------\x1B[0m
    ''');
  }

  void editDetails() {
    ColorfulPrint.blue('Edit Details');
    ColorfulPrint.yellow('''
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Salary
      5 | Role

      ''');

    var userInput = stdin.readLineSync();
    switch (userInput) {
      case '1':
        print('');
      case '2':
        print('');
      case '3':
        print('');
      case '4':
        print('');
      case '5':
        print('');
      default:
        print('');
    }
  }

  void newName() {
    ColorfulPrint.green('Access Granted to change the name of $name');
    ColorfulPrint.yellow('Enter a new Name:');
    var userInput = stdin.readLineSync();
    if (userInput!.isEmpty) {
      ColorfulPrint.red('ERROR: Name Cannot be empty!');
    } else {
      name = userInput;
      ColorfulPrint.green('Name updated successfully to $name');
    }
  }
}
