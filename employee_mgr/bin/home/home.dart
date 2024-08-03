import 'dart:io';

import '../mock_storage/storage.dart';
import 'home_print_messages.dart';

class Home {
  // Creates an instance of the mock storage
  var storage = Storage.shared;
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
    var user = Storage.shared.currentUser;
    switch (str) {
      case 'i':
        // Instructions
        instructionsMsg();
      case 'my':
        // My Info
        (user != null)
            ? user.showEmployeeDetails(fullAccess: true, short: false)
            : userError();
      case 'ed':
        // Edit My Info
        if (user != null) {
          storage.editEmployee(user: user);
        }
      case 'li':
        // List Employees
        storage.fetchEmployees(isShort: false);
      case 'so':
        // Sign Out
        signOutMsg();
        storage.signOut();
      case 'new e':
        if (user != null) {
          user.hasAccess() ? storage.addNewEmployee() : accessDeniedMsg();
        }
      case 'ed e':
        if (user != null) {
          user.hasAccess() ? storage.selectEmployeeToEdit() : accessDeniedMsg();
        }
      case 'del e':
        if (user != null) {
          user.hasAccess() ? storage.deleteEmployee() : accessDeniedMsg();
        }
      case 'q':
        // Terminate app (Quit)
        terminateMsg();
        shouldExit = true;
      default:
        unknownInputMsg();
    }
  }
}
