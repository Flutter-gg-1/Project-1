import 'dart:io';
import '../core/all_file.dart';

void deleteEmployee() {
  print('\n_____________# Delete Employee #___________\n');
  print('Enter Employee ID: ');
  final int id = int.parse(stdin.readLineSync()!);
  //deleteEmployeeFunction function call for delete employee
  deleteEmployeeFunction(uid: id);
  print('\nn_____________# Employee Deleted Successfully #___________\n');
  //showPrompt function call for next operation
  showPrompt();
}
