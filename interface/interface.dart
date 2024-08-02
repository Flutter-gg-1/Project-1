import "dart:io";
import "package:ems/emp_data.dart";
import "package:ems/employee.dart";
import "package:ems/global.dart";

interface() {
  /*
  the defult of id is -1 to 
  make sure if the user input
  null value the employee function search
  will return false 
  */
  int id = -1;
  late dynamic user;

  print("Login");
  print("Input your id");

  do {
    String userInput = stdin.readLineSync()!;
    try {
      id = int.parse(userInput);
    } catch (e) {
      print("it not valid id");
    }

    user = getEmployee(id);
    if (user == false) {
      print("The user does not exitst");
    }
  } while (user == false);
  // after initialize a user cast the variable as employee
  user as Employee;

  user.printEmployeeInfo();

  if (user.permission == PermissionLevel.admin.toString()) {
    print("1- Add User");
    String userInput = stdin.readLineSync() ?? "0";
    switch (userInput) {
      case == "1":
        print("Employee name");
        String name = stdin.readLineSync()!;

        print("Salary");
        int salary = 0;
        salary = int.parse(stdin.readLineSync()!);

        print("what is the job description");
        String jobDescriptions = stdin.readLineSync()!;

        print("select on of these permission");
        print("1- admin 2- dev 3- it");
        String permission = getPermission(stdin.readLineSync() ?? "3");

        addEmployee(Employee(
            id: 0,
            name: name,
            salary: salary,
            jobDescriptions: jobDescriptions,
            permission: permission));
        break;
    }
  }
}
