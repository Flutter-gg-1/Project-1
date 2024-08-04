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

void assignPermissions() {
  // Assign permissions to an employee
  print("Enter employee name to assign permissions:");
  String name = stdin.readLineSync() ?? "";

  // Find employee by name
  Employee? employee = findEmployeeByName(name);
  if (employee == null) {
    print("Employee not found.");
    return;
  }

  // Display employee permissions
  print("Enter permissions to assign:");
  Set<String> newPermissions =
      (stdin.readLineSync() ?? "").split(" ").map((e) => e.trim()).toSet();

  // Update employee permissions
  employee.permissions = newPermissions;
  print("Permissions updated successfully.");
}

//This function is used to find an employee by name
Employee? findEmployeeByName(String name) {
  for (var employee in employees) {
    if (employee.name == name) {
      return employee;
    }
  }
  return null;
}
