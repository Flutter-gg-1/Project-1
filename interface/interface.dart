import "dart:io";
import "package:ems/emp_data.dart";
import "package:ems/employee.dart";
import "package:ems/global.dart";
import 'package:ems/ui_messages.dart';

interface() {
  /*
  the defult of id is -1 to 
  make sure if the user input
  null or out of bound value the 
  employee function search
  will return false 
  */
  int id = -1;
  late dynamic user;
  print(loginMessage);
  //the defult admin is 1
  print(inuptIDMessage);

  do {
    String userInput = stdin.readLineSync()!;
    try {
      id = int.parse(userInput);
    } catch (e) {
      print(invalidID);
    }

    user = getEmployee(id);
    if (user == false) {
      print(invalidUser);
    }
  } while (user == false);
  // after initialize a user cast the variable as employee
  user as Employee;

  //seprate normal user and admin
  while (true) {
    if (user.permission == PermissionLevel.admin.toString().split(".").last) {
      adminPage(user);
    } else {
      employeePage(user);
    }
  }
}

void adminPage(Employee user) {
  print(adminMessage);
  print(adminOptions);
  String userInput = stdin.readLineSync() ?? "0";
  switch (userInput) {
    case == "1":
      add();
      break;
    case == "2":
      allEmployees();
      print(editIDInput);

      late int empId;
      late dynamic editEmp;

      do {
        try {
          empId = int.parse(stdin.readLineSync()!);
        } catch (e) {
          print(invalidID);
        }

        editEmp = getEmployee(empId);
        if (editEmp == false) {
          print(invalidUser);
        }
      } while (editEmp == false);

      editEmployee(empId);

      break;
    case == "3":
      allEmployees();
      break;
    case == "0":
      interface();
      break;
  }
}

employeePage(Employee user) {
  print(employeeMessage);
  print(employeeOptions);
  String userInput = stdin.readLineSync() ?? "0";
  switch (userInput) {
    case == "1":
      user.printEmployeeInfo();
      break;

    case == "0":
      interface();
      break;
  }
}

void add() {
  print(employeeNameMessage);
  String name = stdin.readLineSync()!;

  print(inputSalaryMessage);
  double salary = 0;
  salary = double.parse(stdin.readLineSync()!);

  print(jobDescriptionMessage);
  String jobDescriptions = stdin.readLineSync()!;

  print(permissionMassge);
  print(permissionType);
  String permission = getPermission(stdin.readLineSync() ?? "3");
  Employee newEmp = Employee(
      id: 0,
      name: name,
      salary: salary,
      jobDescriptions: jobDescriptions,
      permission: permission);
  addEmployee(newEmp);
}
