import 'dart:io';
import '../core/all_file.dart';

void updateEmployee() {
  print('\n_____________# Update Employee #___________\n');
  print('Enter Employee ID: ');
  final int id = int.parse(stdin.readLineSync()!);
  for (var element in employeeList) {
    if (element['id'].toString().trim() == id.toString().trim()) {
      employeeList.remove(element);
      break;
    }
  }
  print('Enter Employee Salary Update: ');
  int? salary = int.parse(stdin.readLineSync()!);
  print('Enter Employee descriptions Update: ');
  String? descriptions = stdin.readLineSync();
  print('Enter Employee permissions Update: ');
  print('1. Manager  2. Workers  3. Supervisor ');
  //permissions function call for show permissions values
  String? permissions = showPermissions();
  employeeList.add({
    'id': id,
    'salary': salary,
    'descriptions': descriptions,
    'permissions': permissions
  });
  print('\nEmployee Updated Successfully..\n');
  print(employeeList);
  //showPrompt function call for next operation
  showPrompt();
}
