import 'dart:io';
import 'dart:math';

void addEmployee(){
  print('\n_____________# Add Employee #___________\n');
  print('Employee ID will be generated automatically');
  int? id = Random().nextInt(1000);
  print('Enter Employee Name: ');
  String? name = stdin.readLineSync();
  print('Enter Employee Age: ');
  int? age = int.parse(stdin.readLineSync()!);
  print('Enter Employee Phone Number: ');
  String? phoneNumber = stdin.readLineSync();
  print('Enter Employee Position: ');
  String? position = stdin.readLineSync();
  print('Enter Employee Salary: ');
  int? salary = int.parse(stdin.readLineSync()!);
  print('Enter Employee descriptions: ');
  String? descriptions = stdin.readLineSync();
  print('Enter Employee permissions: ');
  String? permissions = stdin.readLineSync();
  print('\n');
  print('ID: $id');
  print('Name: $name');
  print('Age: $age');
  print('Phone Number: $phoneNumber');
  print('Position: $position');
  print('Permissions: $permissions');
  print('Salary: $salary');
  print('Descriptions: $descriptions');
  print('\n');
  print('Add Employee Successfull...');
  print('\n');
}