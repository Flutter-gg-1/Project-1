import 'dart:io';

import '../utils/colorful_print.dart';
import 'employee.dart';

extension EditEmployee on Employee {
  void editDetails() {
    var shouldExit = false;
    do {
      ColorfulPrint.blue('Edit Details');
      ColorfulPrint.yellow('''
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Salary
      5 | Role

      ''');

      var userInput = stdin.readLineSync();
      handleUserInput(userInput ?? '');
    } while (!shouldExit);
  }

  void handleUserInput(String userInput) {
    switch (userInput) {
      case '1':
        print('');
      case '2':
        print('');
      case '3':
        print('');
      case '4':
        print('');
      case '5':
        print('');
      case '9':
        print('exit');
      default:
        print('');
    }
  }

  void newName() {
    ColorfulPrint.green('Access Granted to change the name of $name');
    ColorfulPrint.yellow('Enter a new Name:');
    var userInput = stdin.readLineSync();
    if (userInput!.isEmpty) {
      ColorfulPrint.red('ERROR: Name Cannot be empty!');
    } else {
      name = userInput;
      ColorfulPrint.green('Name updated successfully to $name');
    }
  }
}
