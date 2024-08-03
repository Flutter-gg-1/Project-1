// employee_manager_app.dart

import 'dart:io';
import 'employeeManager.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen blackPen = AnsiPen()..black();
final AnsiPen grayPen = AnsiPen()..gray();
final AnsiPen yallowPen = AnsiPen()..yellow();
final AnsiPen magentapen = AnsiPen()..magenta();

class EmployeeManagerApp {
  final EmployeeManager manager = EmployeeManager();

  void run() {
    bool running = true;

    while (running) {
      print(grayPen("...................................................."));
      print(grayPen("........Welcome to Employee Manager................."));
      print(grayPen("...................................................."));
      print(bluePen('\nChoose an option:'));
      print(blackPen('1. Add Employee'));
      print(blackPen('2. List All Employees'));
      print(blackPen('3. Modify Salary'));
      print(blackPen('4. Modify Job Description'));
      print(blackPen('5. Assign Permission'));
      print(blackPen('7. Exit'));
      print(blackPen(
          '-----------------------------------------------------------------'));
      print(blackPen("........................................."));
      var choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          print(bluePen('Enter employee name:'));
          var name = stdin.readLineSync()!;
          print(bluePen('Enter salary:'));
          var salaryInput = stdin.readLineSync();
          double? salary;
          try {
            salary = double.parse(salaryInput!);
          } catch (e) {
            print(yallowPen('Invalid input. Please enter a valid number.'));
            return; // إذا كان الإدخال غير صحيح، نخرج من البرنامج
          }
          print(bluePen('Enter permissions (comma separated):'));
          List<String> permissions =
              stdin.readLineSync()!.split(',').map((e) => e.trim()).toList();
          print(bluePen('Enter job description:'));
          var jobDescription = stdin.readLineSync()!;
          manager.addEmployee(
            name: name,
            salary: salary,
            permissions: permissions,
            jobDescription: jobDescription,
          );
          break;

        case '2':
          manager.displyEmployees();
          break;

        case '3':
          print(bluePen('Enter employee name:'));
          var empName = stdin.readLineSync()!;

          print(bluePen('Enter new salary:'));
          var newSalary = double.parse(stdin.readLineSync()!);
          manager.editSalary(name: empName, newSalary: newSalary);
          break;

        case '4':
          print(bluePen('Enter employee name:'));
          var empName = stdin.readLineSync()!;
          print(bluePen('Enter new job description:'));
          var newDescription = stdin.readLineSync()!;
          manager.editJobDescription(
              name: empName, newDescription: newDescription);
          break;

        case '5':
          print(bluePen('Enter employee name:'));
          var empName = stdin.readLineSync()!;
          print(bluePen('Enter permission to assign:'));
          var permission = stdin.readLineSync()!;
          manager.assignPermission(name: empName, permission: permission);
          break;

        case '7':
          running = false;
          print(magentapen('Exiting the application.'));
          break;

        default:
          print(yallowPen('Invalid option. Please try again.'));
      }
    }
  }
}
