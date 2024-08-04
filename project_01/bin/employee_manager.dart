import 'dart:io';
import 'employee.dart';

// List to store employee data
List<Employee> employees = [];

void addEmployee() {
  // Add New Employee information
  print("\nAdd New Employee\n");
  print("Enter employee name:");
  String name = stdin.readLineSync() ?? "";

  print("Enter employee salary:");
  double salary = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

  print("Enter job description:");
  String jobDescription = stdin.readLineSync() ?? "";

  print("Enter permissions:");
  Set<String> permissions =
      (stdin.readLineSync() ?? "").split("").map((e) => e.trim()).toSet();

  Employee newEmployee = Employee(
      name: name,
      salary: salary,
      jobDescription: jobDescription,
      permissions: permissions);
  employees.add(newEmployee);

  // Validate input
  if (name != "" &&
      salary != 0 &&
      jobDescription != "" &&
      permissions.isNotEmpty) {
    print("Employee added successfully.");
  } else {
    print("Invalid input. Please try again.");
  }
}
