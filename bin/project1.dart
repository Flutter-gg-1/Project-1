
import 'dart:io';
import 'exit_function.dart';
import 'add_employee.dart';
import 'messages.dart';
void main(List<String> arguments) {
  print("~~~~~~~~~~Welcome Admin~~~~~~~~~~");
  print("Please Choose What To Do Next:");
  print("\n 1-Add A New Employee \n 2-Assign Permissions \n 3-Display Employee Data \n 4-Modify Employee Data 5-List All Employees 6-Exit");
  //go to assigned function based on user's choice
  String? choice = stdin.readLineSync(); 
  while(choice != '6'){
      switch (choice){
        case '1':
        addEmployeea();
        case '2':
        //
        case '3':
        //
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
