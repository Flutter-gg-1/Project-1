// Employee Manager
import 'dart:io';
import '../all_file.dart';
void emp(){
  print('\n_____________########## Employee Dashboard ##########___________\n');
  print('1. Add Employee  2. Delete Employee  3. Update Employee  4. Exit');
  stdout.write('Enter your choice: ');
  int? choice = int.parse(stdin.readLineSync()!);
  switch(choice){
    case 1:
      addEmployee();
      break;
    case 2:
      deleteEmployee();
      break;
    case 3:
      updateEmployee();
      break;
    case 4:
      print('Exit...');
      exit(0);
    default:
      print('Invalid choice , Exit...');
      exit(0);
  }
}