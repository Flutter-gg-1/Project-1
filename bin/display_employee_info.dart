import 'dart:io';
import 'messages.dart';
import 'choose_action.dart';
import 'empolyee_list.dart';

void displayEmpInfo(){
  print("\n\n\n\n");
  print(line);
  print("Add Employee Id To View His Data:");
  String? id = stdin.readLineSync();
  for(Map<String,dynamic> employee in emoployeesList){
  if (employee['id']==id){
    print("Employee ID: ${employee['id']}");
    print("Employee Name: ${employee['Name']}");
    print("Permission: ${employee['Permission']}");
    print("Salary: ${employee['Salary']}");
    print("Job Description: ${employee['Job Description']}");
    stdin.readLineSync(); //for new line after display
    chooseAction();
    }
  }
  print('-Employee Is Not Found-');
  stdin.readLineSync(); //for new line after display
  chooseAction();
}