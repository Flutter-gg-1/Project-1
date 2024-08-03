import 'dart:io';
import 'dart:math';
import '../core/all_file.dart';

void addEmployee() {
  const int thisYear = 2024;
  print('\n_____________# Add Employee #___________\n');
  print('Employee ID will be generated automatically');
  final int id = Random().nextInt(1000);
  print('Enter Employee Name: ');
  final String? name = stdin.readLineSync();
  print('Enter Employee Birth Year(Gregorian date): ');
  final int year = int.parse(stdin.readLineSync()!);
  final int age = thisYear - year;
  print('Enter Employee Phone Number: ');
  final String? phoneNumber = stdin.readLineSync();
  print('Enter Employee Position: ');
  final String? position = stdin.readLineSync();
  print('Enter Employee Salary: ');
  int? salary = int.parse(stdin.readLineSync()!);
  print('Enter Employee descriptions: ');
  String? descriptions = stdin.readLineSync();
  print('Enter Employee permissions: ');
  print('1. Manager  2. Workers  3. Supervisor ');
  //permissions function call for show permissions values
  String? permissions = showPermissions();
  print('\nAdd Employee Successful...\n');
  Map<String, dynamic> employee = {};
  employee.addAll({
    'id': id,
    'name': name,
    'age': age,
    'phoneNumber': phoneNumber,
    'position': position,
    'salary': salary,
    'descriptions': descriptions,
    'permissions': permissions
  });
  employeeList.add(employee);
  // printMyValue function call for show employee list
  printMyValue(employeeList);

  //showPrompt function call for next operation
  showPrompt();
}
