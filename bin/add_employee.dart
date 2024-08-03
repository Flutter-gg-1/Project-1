import 'dart:io';
import 'dart:math';

void addEmployeea(){
 Random random = Random();
  final id =random.nextInt(10000).toString(); 
  print("Add Employee Name:");
  String? name = stdin.readLineSync();
  print("Add Permission:");
  String? permission =  stdin.readLineSync();
    print("Add Salary:");
  String? salary = stdin.readLineSync();
  print("Add Job Description:");
  String? jobDesc =  stdin.readLineSync();
  Map<String,dynamic> employee ={
    'id': id,
    'Name': name,
    'Permission': permission,
    'Salary': name,
    'Job Description': jobDesc,
    };
  //emoployeesList.add(account);
  print("A New Employee Is Successfully Added, Employee ID is is $id");
  stdin.readLineSync();
 }