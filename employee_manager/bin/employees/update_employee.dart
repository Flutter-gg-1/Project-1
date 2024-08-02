import 'dart:io';
import 'dart:math';
import '../all_file.dart';

void updateEmployee() {
  print('\n_____________# Update Employee #___________\n');
  print('Enter Employee ID: ');
  final int id = int.parse(stdin.readLineSync()!);
  Map<String, dynamic> employee = {};
  for (var element in employeeList) {
    if (element['id'].toString().trim() == id.toString().trim()) {
      employee = element;
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
  int? perInput = int.parse(stdin.readLineSync()!);
  String? permissions;
  switch (perInput) {
    case 1:
      permissions = 'Manager';
      break;
    case 2:
      permissions = 'Workers';
      break;
    case 3:
      permissions = 'Supervisor';
      break;
  }
  employeeList.add({
    'id': id,
    'salary': salary,
    'descriptions': descriptions,
    'permissions': permissions
  });
  print('\nEmployee Updated Successfully..\n');
  print(employeeList);
  print('\n1. Add Employee  2. Delete Employee  3. Update Employee  4. Employee Dashboard  5. Exit\n');
  print('Enter your choice: ');
  int? choice = int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      addEmployee();
      break;
    case 2:
      deleteEmployee();
      break;
    case 3:
      updateEmployee();
      break;
    case 4:
      emp();
      break;
    case 5:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}
