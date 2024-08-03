import 'dart:math';
import '../core/all_file.dart';

addEmployeeFunction(
    {required String empName,
    required String empNumber,
    required int empYear,
    required String empPosition,
    required int empSalary,
    required String empDescription}) {
  const int thisYear = 2024;

  final int id = Random().nextInt(1000);
  final String name = empName;
  final int year = empYear;
  final int age = thisYear - year;
  final String phoneNumber = empNumber;
  final String position = empPosition;
  String? descriptions = empDescription;
  int? salary = empSalary;
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
}
