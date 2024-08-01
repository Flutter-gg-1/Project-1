// imports
import 'dart:io';             // library to interact with user
import 'manager_menu.dart';   // function to print manager's menu

void main() {
  // initialize list of employees
  List employees = [];
  while_manage:
  while(true) {
    managerMenu();
    stdout.write("Choose an option : ");
    String? action = stdin.readLineSync();
    switch(action) {
      case '0' :
      print("good bye ...");
      break while_manage;

      case '1' :
      // view employees

      case '2' :
      // add new employee

      case '3' :
      // modify employee info

      case '4' :
      // remove employee

      default :
      print("ERROR !! : Invalid choice\n");
    }
  }
}