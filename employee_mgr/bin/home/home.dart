import 'dart:io';

import '../mock_storage/storage.dart';
import '../model/employee.dart';

class Home {
  var storage = Storage();

  var shouldExit = false;

  /* MARK: - FUNCTIONS */
  // App Lifecycle
  void runApp() {
    showInstructions();
    do {
      print('');
      var userInput = stdin.readLineSync();

      if (userInput == 'q') {
        terminateMsg();
        shouldExit = true;
      } else if (userInput == 'i') {
        showInstructions();
      } else {
        handleUserInput(userInput ?? '');
      }
    } while (!shouldExit);
  }

  Employee? auth() {
    do {
      for (var employee in storage.employees) {
        employee.showEmployeeDeatails();
      }
      print('Who are you? Enter your ID to login');
      var userInput = stdin.readLineSync();
      storage.currentUser =
          storage.employees.firstWhere((e) => e.id.toString() == userInput!);
    } while (storage.currentUser == null);
    return null;
  }

  // Print instructions for user input
  void showInstructions() => print('''

        Common Functions:
          1 | Show my Info
          2 | Edit my Info

          i | For instructions
          s | SignOut
          q | For terminating the app

        Manager Functions:
          new | Add New Employee
          le  | List Employees
          lm  | List Managers

      ''');

  // Cases for user input
  void handleUserInput(String str) {
    switch (str) {
      case '1':
        print('');
      case '2':
        print('');
      case 'i':
        print('');
      case 's':
        storage.currentUser = null;
      case 'new':
        print('');
      case 'le':
        print('');
      case 'lm':
        print('');

      default:
        unknownInput();
    }
  }

  /* Simple Print Functions */
  // SignOut
  void signOutMsg() => print('Signed Out');
  // Terminate App
  void terminateMsg() => print('APP TERMINATED!');
  // Unknow Input
  void unknownInput() => print('ERROR: UNKNOWN INPUT!');
  // Access Rightss
  void accessDenied() => print(
      'Access Denied! \nYou do not have permissions to view the requested data!');
}
