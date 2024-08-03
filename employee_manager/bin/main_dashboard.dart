// Main Dashboard
import 'dart:io';
import 'core/all_file.dart';

void mainDashboard() {
  print('\n______________########## Main Dashboard ##########___________');
  print('1. Employee Manager  2. Employees Information  3. Exit');
  print('Enter your choice: \n');
  int? choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      employeeManager();
      break;
    case 2:
      print(
          '\n_____________########## All Employees Information ##########___________\n');
      // printMyValue function call for show employee list
      print(employeeList);
      //showPrompt function call for next operation
      showPrompt();
      break;
    case 3:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}
