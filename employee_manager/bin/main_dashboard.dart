// Main Dashboard
import 'dart:io';
import 'core/all_file.dart';
void mainDashboard(){
  print('\n______________########## Main Dashboard ##########___________');
  print('1. Employee Manager  2. Employee Profile  3. Exit');
  print('Enter your choice: \n');
  int? choice = int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      employeeManager();
      break;
    case 2:
      supervisorEmployee();
      break;
    case 3:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}