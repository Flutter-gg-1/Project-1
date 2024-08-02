// Employee Manager
import 'dart:io';
import 'all_file.dart';
void employeeManager(){
  print('Dashboard of Employee Manager');
  print('1. Manage Employee  2. Supervisor');
  print('3. Workers   4. Main Dashboard');
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
      workers();
      break;
    case 4:
      mainDashboard();
      break;
    default:
      print('Invalid choice');
  }
}