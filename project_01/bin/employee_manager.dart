import 'dart:io';
import 'employee.dart';

List<Employee> employees = [];

void addEmployee() {
  print("Enter employee name:");
  String name = stdin.readLineSync() ?? "";

  print("Enter employee salary:");
  double salary = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  print("Enter job description:");
  String jobDescription = stdin.readLineSync() ?? "";

  print("Enter permissions (comma separated):");
  Set<String> permissions =
      (stdin.readLineSync() ?? "").split(',').map((e) => e.trim()).toSet();

  Employee newEmployee = Employee(
      name: name,
      salary: salary,
      jobDescription: jobDescription,
      permissions: permissions);
  employees.add(newEmployee);
  print("Employee added successfully.");
}

void assignPermissions() {
  print("Enter employee name to assign permissions:");
  String name = stdin.readLineSync() ?? "";

  Employee? employee = findEmployeeByName(name);
  if (employee == null) {
    print("Employee not found.");
    return;
  }

  print("Enter new permissions (comma separated):");
  Set<String> newPermissions =
      (stdin.readLineSync() ?? "").split(',').map((e) => e.trim()).toSet();

  employee.permissions = newPermissions;
  print("Permissions updated successfully.");
}

void displayEmployeeData() {
  print("Enter employee name to display data:");
  String name = stdin.readLineSync() ?? "";

  Employee? employee = findEmployeeByName(name);
  if (employee == null) {
    print("Employee not found.");
    return;
  }

  printEmployeeDetails(employee);
}

void modifySalary() {
  print("Enter employee name to modify salary:");
  String name = stdin.readLineSync() ?? "";

  Employee? employee = findEmployeeByName(name);
  if (employee == null) {
    print("Employee not found.");
    return;
  }

  print("Enter new salary:");
  double newSalary =
      double.tryParse(stdin.readLineSync() ?? "") ?? employee.salary;

  employee.salary = newSalary;
  print("Salary updated successfully.");
}

void modifyJobDescription() {
  print("Enter employee name to modify job description:");
  String name = stdin.readLineSync() ?? "";

  Employee? employee = findEmployeeByName(name);
  if (employee == null) {
    print("Employee not found.");
    return;
  }

  print("Enter new job description:");
  String newJobDescription = stdin.readLineSync() ?? employee.jobDescription;

  employee.jobDescription = newJobDescription;
  print("Job description updated successfully.");
}

void listAllEmployees() {
  if (employees.isEmpty) {
    print("No employees found.");
  } else {
    for (var employee in employees) {
      printEmployeeDetails(employee);
    }
  }
}

Employee? findEmployeeByName(String name) {
  for (var employee in employees) {
    if (employee.name == name) {
      return employee;
    }
  }
  return null;
}

void printEmployeeDetails(Employee employee) {
  print("Name: ${employee.name}");
  print("Salary: \$${employee.salary.toStringAsFixed(2)}");
  print("Job Description: ${employee.jobDescription}");
  print("Permissions: ${employee.permissions.join(', ')}");
}
