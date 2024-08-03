import 'dart:io';
import 'messages.dart';
import 'choose_action.dart';
import 'empolyee_list.dart';

void displayAllEmp(){

  print("\n\n\n\n");
  print(line);
  //check if there are any employee to display
  if (emoployeesList.isEmpty){
    print('-No Employee Found-');
    stdin.readLineSync(); //for new line after display
    chooseAction();
  }
  for(Map<String,dynamic> employee in emoployeesList){
    print("Employee ID: ${employee['id']}");
    print("Employee Name: ${employee['Name']}");
    print("Permission: ${employee['Permission']}");
    print("Salary: ${employee['Salary']}");
    print("Job Description: ${employee['Job Description']}");
    print("--------");
  }
    stdin.readLineSync(); //for new line after display
    chooseAction();
}