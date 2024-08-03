import 'dart:io';
import 'delete_employee.dart';
import 'display_employees.dart';
import 'is_exit.dart';
import 'employee.dart';
import 'update_employee.dart';

void main(List<String> arguments) {
  bool isExit = false;

  do {
    // Display functions Mnue for user to choose from
    print("\n \n \n -----Manange your employees-----");
    print("1. Add employee");
    print("2. Display employees info");
    print("3. Delete employee");
    print("4. Update employee info");
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
          deleteEmployee();
        }
        break;
      case "4":
        {
          updateEmployee();
        }
        break;

      case "q" || "Q":
        {
          isExit = exitcode();
        }
        break;
    }
  } while (!isExit);
}
