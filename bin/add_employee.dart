import 'dart:io';
import 'dart:math';
import 'empolyee_list.dart';
import 'choose_action.dart';
import 'messages.dart';

void addEmployeea(){
print("\n\n\n\n");
print(line);

  Random random = Random();
  final id =random.nextInt(10000).toString(); 
  String? name;
  String? permission;
  String? salary;
  String? jobDesc;
  //validate that inputs are not empty
  do{
  print("Add Employee Name:");
  name = stdin.readLineSync();
  if(name == "" || name == null){
    print("-Plaese Enter A Name-");
  }
  }while(name=="" || name==null);

    do{
  print("Add Permission:");
  permission =  stdin.readLineSync();
  if(permission == "" || permission == null){
    print("-Plaese Enter A Permission-");
  }
  }while(permission=="" || permission==null);
  
    do{
  print("Add Salary:");
  salary = stdin.readLineSync();
  if(salary == "" || salary == null){
    print("-Plaese Enter A Salary-");
  }
  }while(salary=="" || salary==null);
  
    do{
  print("Add Job Description:");
  jobDesc =  stdin.readLineSync();
  if(jobDesc == "" || jobDesc == null){
    print("-Plaese Enter A Job Description-");
  }
  }while(jobDesc=="" || jobDesc==null);
  
  //add entered info to employee map
  Map<String,dynamic> employee ={
    'id': id,
    'Name': name,
    'Permission': permission,
    'Salary': salary,
    'Job Description': jobDesc,
    };

  //add added employee to employees list
  emoployeesList.add(employee);
  print("-A New Employee Is Successfully Added, Employee ID is $id-");
  stdin.readLineSync(); //for new line after display
  chooseAction();
 }