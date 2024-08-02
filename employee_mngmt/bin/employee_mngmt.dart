import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

import 'employee.dart';
import 'exit_method.dart';

void main(List<String> arguments) async {
  bool isExit = false;
  File file = File('login/employee.json');
  String records = await file.readAsString();
  List employees = jsonDecode(records);
  do {
    print('\n---Welcome to The Employee Management System---');

    print('Enter your Login credentials: ');
    stdout.write('ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('password: ');
    String password = stdin.readLineSync()!;
    String hash = sha256.convert(utf8.encode(password)).toString();

    bool loginSuccess = false;
    String userName = '';
    for (var employee in employees) {
      if (employee['empID'] == id && employee['passwordHash'] == password) {
        loginSuccess = true;
        userName = '${employee['firstName']}';
        break;
      }
    }

    if (loginSuccess) {
      print('\n---Welcome $userName---');
    } else {
      print('Login failed');
      continue;
    }

    // Employee? registeredUser;

    if (userName == 'Admin') {
      print('1: Add Employee');
      print('2: Choose Employee');
      print('0: Exit');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          print('To add a new Employee, complete the following');
          String? firstName;
          String? lastName;
          String? role;

          stdout.write('First Name: ');
          firstName = stdin.readLineSync();
          stdout.write('Last Name: ');
          lastName = stdin.readLineSync();
          stdout.write('Role: ');
          role = stdin.readLineSync();

          Employee(firstName: firstName, lastName: lastName, role: role);

        case '2':
          stdout.write('Enter Employee ID: ');
          String? empID = stdin.readLineSync();

          print('1: \nView information');
          print('2: Update Salary');
          print('3: Set Permissoins');

          stdout.write('\nEnter your choice: ');
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              Employee.viewInfo(Employee.getEmployee(empID!));
            case '2':
              stdout.write('Enter New Salary: ');
              int? salary = int.parse(stdin.readLineSync()!);
              Employee.setSalary(Employee.getEmployee(empID!)!, salary);
              print('Salary has been updated.');
            case '3':
              stdout.write(
                  'Are you sure you want to give permission to Employee $empID? y/n: ');
              String? answer = stdin.readLineSync();
              if (answer!.toLowerCase() == 'y') {
                Employee.addToPermission(Employee.getEmployee(empID!)!);
                print('Employee added to the list of Permissoins.');
              }
          }

        case '0' || '':
          isExit = exitMethod();
        default:
      }
    } else {
      print('1: View my Information');
      print('2: Set password');
      print('3: View Department ID');
      print('0: Exit\n');

      //change later after login logic
      Employee emp =
          Employee(firstName: 'firstName', lastName: 'lastName', role: 'role');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          Employee.viewInfo(emp);
        case '2':
          Employee.setPassword(emp);
        case '3':
          print('Department Id = ${emp.dept!.deptName}');
        case '0' || '':
          isExit = exitMethod();
        default:
      }
    }
  } while (!isExit);
}
