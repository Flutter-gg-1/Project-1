import 'dart:io';
import 'package:ems/employee.dart';
import 'global.dart';
import 'ui_messages.dart';
void addEmployee(Employee emp) {
  if (emps.isEmpty) {
    emp.id = 1;
  } else {
    emp.id = emps.last.id + 1;
    emps.add(emp);
    print(successAdd);
    emp.printEmployeeInfo();
  }
}

getEmployee(int id) {
  for (Employee emp in emps) {
    if (emp.id == id) {
      return emp;
    }
  }
  return false;
}

void printAllEmployees() {
  for (var emp in emps) {
    emp.printEmployeeInfo();
  }
}

void editEmployee(int id) {
  for (var emp in emps) {
    if (emp.id == id) {
      emp = edit(emp);
    }
  }
}

void allEmployees() {
  for (Employee emp in emps) {
    emp.printEmployeeInfo();
  }
}

Employee edit(Employee emp) {
  print(editOptions);
  var eidtOption = stdin.readLineSync()!;
  switch (eidtOption) {
    //change name
    case == "1":
      print(employeeNameMessage);
      String name = stdin.readLineSync()!;
      emp.name = name;
      return emp;
    //change description
    case == "2":
      print(jobDescriptionMessage);
      String jobDescriptions = stdin.readLineSync()!;
      emp.jobDescriptions = jobDescriptions;
      return emp;
    //change salary
    case == "3":
      print(inputSalaryMessage);
      double salary = double.parse(stdin.readLineSync()!);
      emp.salary = salary;
      return emp;
    //chage permission
    case == "4":
      print(permissionMassge);
      print(permissionType);
      String permission = getPermission(stdin.readLineSync()!);
      emp.permission = permission;
      return emp;
  }
  return emp;
}

String getPermission(var permission) {
  switch (permission) {
    case == "1":
      return PermissionLevel.admin.toString().split(".").last;
    case == "2":
      return PermissionLevel.dev.toString().split(".").last;
    case == "3":
      return PermissionLevel.it.toString().split(".").last;
  }
  return PermissionLevel.it.toString().split(".").last;
}
