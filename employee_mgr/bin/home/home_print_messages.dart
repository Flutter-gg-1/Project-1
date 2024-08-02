import '../utils/colorful_print.dart';
import 'home.dart';

extension HomePrintMessages on Home {
  /* Simple Print Functions */

  // Print instructions for user input
  void showInstructions() => ColorfulPrint.yellow('''
  ---------------------------------------
    Common Functions:
      1 | Show my Info
      2 | Edit my Info

      s | SignOut
      q | Terminate app

    Manager Functions:
      new | Add New Employee
      le  | List Employees
      lm  | List Managers
  ---------------------------------------
    ''');

  // Could not fetch User
  void homeMsg() => ColorfulPrint.magenta('''
  -------------------------------------
    * Welcome to FANTASY LAND! *
    Enter 'i' for Instructions
  -------------------------------------
    ''');

  void userError() => ColorfulPrint.red('ERROR: Could not fetch current user!');
  // SignOut
  void signOutMsg() => ColorfulPrint.red('Signed Out');
  // Terminate App
  void terminateMsg() => ColorfulPrint.red('APP TERMINATED!');
  // Unknow Input
  void unknownInput() => ColorfulPrint.red('ERROR: UNKNOWN INPUT!');
  // Access Rightss
  void accessDenied() => ColorfulPrint.red(
      'Access Denied! \nYou do not have permissions to view the requested data!');
}
