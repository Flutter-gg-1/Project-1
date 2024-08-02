import "dart:io";
import "package:ems/emp_data.dart";
import "package:ems/employee.dart";

interface() {
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
  user as Employee;
  user.printEmployeeInfo();
}
