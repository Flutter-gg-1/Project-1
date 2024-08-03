import 'dart:io';
import 'exit_function.dart';
import 'add_employee.dart';
import 'messages.dart';
import 'display_employee_info.dart';
import 'modify_employee_infp.dart';
import 'display_all_employees.dart';
void chooseAction(){
  print(line);
  print(next);
  print("\n 1-Add A New Employee \n 2-Display Employee Data \n 3-Modify Employee Data \n 4-List All Employees \n 5-Exit");
  //go to assigned function based on user's choice
  String? choice = stdin.readLineSync(); 
  while(choice != '5'){
      switch (choice){
        case '1':
        addEmployeea();
        case '2':
        displayEmpInfo();
        case '3':
        modifyEmpInfo();
        case '4':
        displayAllEmp();
        default:
      print(tryAgain);
      choice = stdin.readLineSync();   }
    }
    //Exit function when choice is 5
    exitProgram();
}