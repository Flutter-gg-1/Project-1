import "dart:io";
import "package:ems/emp_data.dart";
import "package:ems/employee.dart";
import "package:ems/global.dart";

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
  print("*****Login*****");
  //the defult admin is 1
  print("Input your id");

  do {
    String userInput = stdin.readLineSync()!;
    try {
      id = int.parse(userInput);
    } catch (e) {
      print("it not valid id DX...");
    }

    user = getEmployee(id);
    if (user == false) {
      print("The user does not exitst DX....");
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
  print("*****ADMIN*****");
  print("1- Add employee |2- edit employee| 3 Show all employee  |0-logout");
  String userInput = stdin.readLineSync() ?? "0";
  switch (userInput) {
    case == "1":
      add();
      break;
    case == "2":
      allEmployees();
      print("input employee id to edit");

      late int empId;
      late var editEmp;

      do {
        try {
          empId = int.parse(stdin.readLineSync()!);
        } catch (e) {
          print("it not valid id DX...");
        }

        editEmp = getEmployee(empId);
        if (editEmp == false) {
          print("The user does not exitst DX...");
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
  print("1-show my  | info 0-logout");
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
  print("Employee name");
  String name = stdin.readLineSync()!;

  print("Salary  *Only numbers*");
  double salary = 0;
  salary = double.parse(stdin.readLineSync()!);

  print("what is the job description");
  String jobDescriptions = stdin.readLineSync()!;

  print("select on of these permission");
  print("1- admin |2- dev |3- it");
  String permission = getPermission(stdin.readLineSync() ?? "3");
  Employee newEmp = Employee(
      id: 0,
      name: name,
      salary: salary,
      jobDescriptions: jobDescriptions,
      permission: permission);
  addEmployee(newEmp);
}
