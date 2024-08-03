import '../utils/colorful_print.dart';
import 'home.dart';

extension HomePrintMessages on Home {
  /* Simple Print Functions */

  // Print instructions for user input
  void instructionsMsg() => ColorfulPrint.yellow('''
  ---------------------------------------
    Common Functions:
      1  | Show my Info
      2  | Edit my Info
      3  | List Employees

      so | SignOut
      q  | Terminate app

    Privilaged Functions:
      new | Add New Employee
      lm  | List Managers
  ---------------------------------------
    ''');

  // Could not fetch User
  void homeMsg() => ColorfulPrint.magenta('''
  -------------------------------------
    * Welcome to FANTASY LAND! *

    Logged in as: ${storage.currentUser == null ? '' : storage.currentUser!.name}
    Enter 'i' for Instructions
  -------------------------------------
    ''');

  void userError() => ColorfulPrint.red('ERROR: Could not fetch current user!');
  // SignOut
  void signOutMsg() => ColorfulPrint.red('Signed Out');
  // Terminate App
  void terminateMsg() => ColorfulPrint.red('APP TERMINATED!');
  // Unknow Input
  void unknownInputMsg() => ColorfulPrint.red('ERROR: UNKNOWN INPUT!');
  // Access Rightss
  void accessDeniedMsg() => ColorfulPrint.red(
      'Access Denied! \nYou do not have permissions to view the requested data!');
}
