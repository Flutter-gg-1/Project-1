import 'dart:io';

class Home {
  // var user = Storage.currentUser;
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

  // Print instructions for user input
  void showInstructions() => print('''

          1 | List all Managers
          2 | List all Employees
          3 | Add New Employee
          i | For instructions
          q | For terminating the app

      ''');

  // Cases for user input
  void handleUserInput(String str) {
    switch (str) {
      case '1':
        print('');
      default:
        unknownInput();
    }
  }

  /* Simple Print Functions */
  // Terminate App
  void terminateMsg() => print('APP TERMINATED!');
  // Unknow Input
  void unknownInput() => print('ERROR: UNKNOWN INPUT!');
  // Access Rightss
  void accessDenied() => print(
      'Access Denied! \nYou do not have permissions to view the requested data!');
}
