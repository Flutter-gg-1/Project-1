import '../utils/colorful_print.dart';
import 'home.dart';

extension HomePrintMessages on Home {
  /* Simple Print Functions */

  // Print instructions for user input
  void instructionsMsg() => ColorfulPrint.yellow('''
  ---------------------------------------
    Common Functions:
      my info  | Show my Info
      edit     | Edit my Info
      list all | List Employees
      signOut  | Sign Out

    Privilaged Functions:
      new emp  | Add New Employee
      edit emp | Edit Existing Employee Details
      del emp  | Delete an Employee
  ---------------------------------------
      q        | Terminate app
  ---------------------------------------
    ''');

  // Could not fetch User
  void homeMsg() => ColorfulPrint.magenta('''
  -------------------------------------
    * Welcome to FANTASY LAND! *

    Logged in as: ${storage.currentUser == null ? '' : storage.currentUser!.name}
    Role: ${storage.currentUser == null ? '' : storage.currentUser!.role.name}
    
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
