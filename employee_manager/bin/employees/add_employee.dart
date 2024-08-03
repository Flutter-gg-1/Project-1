import 'dart:io';
import '../core/all_file.dart';

void addEmployee() {
  print('\n_____________# Add Employee #___________\n');
  print('Enter Employee Name: ');
  final String name = stdin.readLineSync()!;
  print('Enter Employee Birth Year(Gregorian date): ');
  final int year = int.parse(stdin.readLineSync()!);
  print('Enter Employee Phone Number: ');
  final String phoneNumber = stdin.readLineSync()!;
  print('Enter Employee Position: ');
  final String position = stdin.readLineSync()!;
  print('Enter Position descriptions: ');
  String descriptions = stdin.readLineSync()!;
  print('Enter Employee Salary: ');
  int? salary = int.parse(stdin.readLineSync()!);

  //addEmployeeFunction function call for add employee details
  addEmployeeFunction(
    empName: name,
    empNumber: phoneNumber,
    empYear: year,
    empPosition: position,
    empSalary: salary,
    empDescription: descriptions,
  );
  print('\nAdd Employee Successful...\n');
  //showPrompt function call for next operation
  showPrompt();
}
