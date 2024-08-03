import 'dart:io';
import '../core/all_file.dart';

void updateEmployee() {
  print('\n_____________# Update Employee #___________\n');
  print('Enter Employee ID: ');
  final int id = int.parse(stdin.readLineSync()!);
  print('Enter Employee Update Salary: ');
  int salary = int.parse(stdin.readLineSync()!);
  print('Enter Position Update Descriptions: ');
  String descriptions = stdin.readLineSync()!;
  //updateEmployeeFunction function call for update employee
  updateEmployeeFunction(
    uid: id,
    salary: salary,
    descriptions: descriptions,
  );
  print('\nEmployee Updated Successfully..\n');
  print(employeeList);
  //showPrompt function call for next operation
  showPrompt();
}
