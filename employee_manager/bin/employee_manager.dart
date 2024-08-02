import 'dart:io';
import 'display_employees.dart';
import 'is_exit.dart';
import 'employee.dart';

void main(List<String> arguments) {
  bool isExit = false;

  do {
    print("\n \n \n -----Manange your employees-----");
    print("1. Add employee");
    print("2. Display employees info");
    print("3. Delete employee");
    print("4. Search for employee");
    print("5. Update employee info");
    print("6. Permissions");
    print("Q. Exit");

    String input = stdin.readLineSync()!;

    switch (input) {
      case "1":
        {
          Employee emp = Employee();
          emp.addEmployee();
        }
        break;
      case "2":
        {
          displayEmployee();
        }
        break;
      case "3":
        {
          Employee emp = Employee();
          print("Enter employee id to delete:");
          int empId = int.parse(stdin.readLineSync()!);
          emp.deleteEmployee(empId);
        }
        break;
      case "4":
        {}
        break;
      case "5":
        {}
        break;
      case "6":
        {}
        break;
      case "7":
        {}
        break;
      case "q" || "Q":
        {
          isExit = exitcode();
        }
        break;
    }
  } while (!isExit);
}
