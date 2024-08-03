import 'dart:io';

import '../mock_storage/storage.dart';
import 'home_print_messages.dart';

class Home {
  // Creates an instance of the mock storage
  var storage = Storage();
  // Flag tp Terminate the app
  var shouldExit = false;

  /* MARK: - FUNCTIONS */

  // App Home
  void runApp() {
    do {
      if (storage.currentUser == null) {
        storage.signIn();
      } else {
        homeMsg();
        var userInput = stdin.readLineSync();
        handleUserInput(userInput ?? '');
      }
    } while (!shouldExit);
  }

  // Cases for user input
  void handleUserInput(String str) {
    var user = storage.currentUser;
    switch (str) {
      case '1':
        (user != null) ? user.showEmployeeDeatails() : userError();
      case '2':
        if (user != null) {
          storage.editEmployee(user: user);
        }
      case 'i':
        instructionsMsg();
      case 's':
        signOutMsg();
        storage.signOut();
      case 'q':
        terminateMsg();
        shouldExit = true;
      case 'new':
        print('');
      case 'le':
        print('');
      case 'lm':
        print('');

      default:
        unknownInputMsg();
    }
  }
}
