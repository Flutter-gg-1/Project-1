import 'dart:io';
import 'exit_function.dart';
import 'add_employee.dart';
import 'messages.dart';

void chooseAction(){
  print(line);
  print(next);
  print("\n 1-Add A New Employee \n 2-Assign Permissions \n 3-Display Employee Data \n 4-Modify Employee Data \n 5-List All Employees \n 6-Exit");
  //go to assigned function based on user's choice
  String? choice = stdin.readLineSync(); 
  while(choice != '6'){
      switch (choice){
        case '1':
        addEmployeea();
        case '2':
        //assignPermission();
        case '3':
        //displayEmpInfo();
        case '4':
        //
        case '5':
        //
        default:
      print(tryAgain);
      choice = stdin.readLineSync();   }
    }
    //Exit function when choice is 6
    exitProgram();
}