import "dart:io";
import "package:ems/emp_data.dart";
import "package:ems/employee.dart";

interface() {
  late int id;
  var user;

  print("Login");
  print("Input your id");

  do {
    try {
      id = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Enter only number");
    }

    user = getEmployee(id);
    if (user == false) {
      print("The user does not exitst");
    }
  } while (user == false);
  user as Employee;
  }
