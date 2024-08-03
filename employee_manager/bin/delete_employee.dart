import 'dart:io';

import 'global_var.dart';

deleteEmployee() {
  int initialLength = employees.length;
  print("Enter employee id to delete:");
  int empId = int.parse(stdin.readLineSync()!);

  employees.removeWhere((employee) => employee['id'] == empId);

//check if employee was deleted successfully
  if (employees.length == initialLength) {
    print('Employee with ID $empId not found.');
  } else {
    print("Employee with $empId id deleted successfully");
  }
}
