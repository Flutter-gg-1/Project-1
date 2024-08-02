// Employee Manager
import 'dart:io';
import 'all_file.dart';
void employeeManager(){
  print('\n_____________########## Dashboard of Employee Manager ##########___________\n');
  print('1. Employee  2. Main Dashboard');
  print('to exit press 0\n');
  stdout.write('Enter your choice: ');
  int? choice = int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      emp();
      break;
    case 2:
      mainDashboard();
      break;
    case 0:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}