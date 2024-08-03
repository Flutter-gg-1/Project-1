import 'dart:io';
import 'all_file.dart';

void printMyValue(var value) {
  print(value);
}

void showPrompt() {
  const String prompt =
      '\n1. Add Employee  2. Delete Employee  3. Update Employee  4. Main Dashboard  5. Exit\n';
  print(prompt);
  const String prompt1 = 'Enter your choice: ';
  print(prompt1);
  int? choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
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
      mainDashboard();
      break;
    case 5:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}

String? showPermissions() {
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
  return permissions;
}
