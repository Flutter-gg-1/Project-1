// Main Dashboard
import 'dart:io';
import 'all_file.dart';
void mainDashboard(){
  print('Main Dashboard');
  print('1. Employee Manager  2. Supervisor  3. Exit');
  stdout.write('Enter your choice: ');
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