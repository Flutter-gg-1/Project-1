import 'dart:io';
import 'messages.dart';
import 'choose_action.dart';
import 'empolyee_list.dart';

void modifyEmpInfo(){
  String? name;
  String? permission;
  String? salary;
  String? jobDesc;
  print("\n\n\n\n");
  print(line);
  print("Enter Employee Id To modify His Data:");
  String? id = stdin.readLineSync();
  for(Map<String,dynamic> employee in emoployeesList){
  if (employee['id']==id){
  //validate that inputs are not empty
  
  print("Current Employee Name Is ${employee['Name']}.Enter New Employee Name:");
  name = stdin.readLineSync();

  while(name=="" || name==null){
    print("-Plaese Enter A Name-");
    name = stdin.readLineSync();
  }

    do{
  print("Current Permission Is ${employee['Permission']}.Enter New Permission:");
  permission =  stdin.readLineSync();
  if(permission == "" || permission == null){
    print("-Plaese Enter A Permission-");
  }
  }while(permission=="" || permission==null);
  
    do{
  print("Current Salary is ${employee['Permission']}.Enter New Salary:");
  salary = stdin.readLineSync();
  if(salary == "" || salary == null){
    print("-Plaese Enter A Salary-");
  }
  }while(salary=="" || salary==null);
  
    do{
  print("Current Job Description is ${employee['Job Description']}.Enter New Job Description:");
  jobDesc =  stdin.readLineSync();
  if(jobDesc == "" || jobDesc == null){
    print("-Plaese Enter A Job Description-");
  }
  }while(jobDesc=="" || jobDesc==null);
  

    //replace entered info in employee map
    employee['Name'] = name;
    employee['Permission'] = permission;
    employee['Salary'] = salary;
    employee['Job Description'] = jobDesc;
    
    print("-Employee Data Is Successfully Modified-");
    stdin.readLineSync(); //for new line after display
    chooseAction();
    }
  }
  print('-Employee Is Not Found-');
  stdin.readLineSync(); //for new line after display
  chooseAction();
}