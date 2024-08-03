import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/storage.dart';
import'../track_employee/log.dart' as log;
modify(){
  const instructure = '\n1-Salary\n2-Permission\n3-Job title\n4-Job description\n0-exit';
  PrintWithColor.green(instructure);
  PrintWithColor.green('input :');
  String input = stdin.readLineSync().toString().trim();
  switch (input) {
    case '1':
      modifySalary();
      break;
    case '2':
      PrintWithColor.red('Permission type = A , B , C');
      modifyPermission();
      break;
    case '3':
      modifyTitle();
      break;
    case '4':
      modifyDescription();
      break;
    case '0':
      break;
    default:
  }
}

//modify salary
modifySalary(){
  PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new salary :');
double salary = double.parse(stdin.readLineSync().toString().trim());

if (Storage.info.containsKey(name)) {
  /* update salary value
    salary index = 0  VVV    */
  Storage.info[name]![0]='Salary : $salary';
  log.Track.addToLog(name: name, opration: 'Employee salary change  to $salary');
  PrintWithColor.green('Done');
  
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}

//modify permission
modifyPermission(){
  PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new permission :');
String permission = stdin.readLineSync().toString().trim();

if (Storage.info.containsKey(name)) {
  /*update permission value
  permission index = 3  VVV   */
  Storage.info[name]![3]='Permission : $permission';
  log.Track.addToLog(name: name, opration: 'Employee permission change  to $permission');
  PrintWithColor.green('Done');
  print(Storage.info);
  
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}

//modify title
modifyTitle(){
  PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new title :');
String title = stdin.readLineSync().toString().trim();

if (Storage.info.containsKey(name)) {
  /*update title value
  title index = 1  VVV   */
  Storage.info[name]![1]='Job title : $title';
  log.Track.addToLog(name: name, opration: 'Employee job title change  to $title');
  PrintWithColor.green('Done');
  
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}

//modify description
modifyDescription(){
  PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new description :');
String description = stdin.readLineSync().toString().trim();

if (Storage.info.containsKey(name)) {
  /*update permission value
  permission index = 2  VVV   */
  Storage.info[name]![2]='Job description : $description';
  log.Track.addToLog(name: name, opration: 'Employee job description change  to $description');
  PrintWithColor.green('Done');
  
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}
