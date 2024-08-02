import 'dart:io';
import 'dart:math';
import '../all_file.dart';

void addEmployee() {
  print('\n_____________# Add Employee #___________\n');
  print('Employee ID will be generated automatically');
  final int id = Random().nextInt(1000);
  print('Enter Employee Name: ');
  final String? name = stdin.readLineSync();
  print('Enter Employee Age: ');
  final int? age = int.parse(stdin.readLineSync()!);
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
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
  print('\nAdd Employee Successfull...\n');
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
