import 'dart:io';

import 'package:employee_manager/enum/user_permission.dart';
import 'package:employee_manager/helpers/display_menu.dart';
import 'package:employee_manager/helpers/json_helper.dart';
import 'package:employee_manager/helpers/print_with_color.dart';
import 'package:employee_manager/src/employee.dart';

/*
*
* Main function
*
* */
void main() {
  // TODO just for testing and see the result, remove it when u finished
  // Init user
  String name = "Fahad Alharbi";
  String password = "1234";
  UserPermission permission = UserPermission.admin;

  // Declare employee
  Employee employee = Employee(
      name: name,
      password: password,
      permission: permission,
      position: 'engineer',
      jobDescription: 'Full stack engineer',
      salary: 42000);

  // Storage URL 😁
  const String filename = 'lib/db/users_data.json';

  // Load accounts from JSON file
  var employeeData =
      JsonHelpers.readJsonFile(filename) as List<Map<String, dynamic>>;

  // To keep the program running
  while (true) {
    // Display menu
    displayMenu();

    // Get user input
    stdout.write('Choose an option: ');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Add employee: ');
        // TODO

        break;
      case '2':
        stdout.write('Edit Employee: ');
        // final accountNumber = stdin.readLineSync()!;
        // removeAccount(accounts, accountNumber);
        break;
      case '3':
        stdout.write('Get one employee: ');
        // final accountNumber = stdin.readLineSync()!;
        // stdout.write('Enter deposit amount: ');
        // final amount = double.parse(stdin.readLineSync()!);
        // deposit(accounts, accountNumber, amount);
        break;
      case '4':
        /*
        * In this case, we will withdraw money from an account
        * */
        stdout.write('Get All employee: ');
        // final accountNumber = stdin.readLineSync()!;
        // stdout.write('Enter withdrawal amount: ');
        // final amount = double.parse(stdin.readLineSync()!);
        // withdraw(accounts, accountNumber, amount);
        break;
      case '5':
        /*
        *
        * In this case, we will save the data to a JSON file before exiting
        *
        * */
        JsonHelpers.writeJsonFile(filePath: filename, data: employeeData);
        printWithColor(text: 'Data was saved 😍', color: 'green');
        printWithColor(text: 'Exiting... see you again 🌹', color: 'Cyan');
        return;
      default:
        /*
        *
        * Default case for invalid option
        *
        * */
        printWithColor(
            text: 'Invalid option. Please try again.', color: 'Cyan');
    }
  }
  // List<Map<String, dynamic>> x = [user.toJson(), user2.toJson()];
  print(employee.toJson());
}
