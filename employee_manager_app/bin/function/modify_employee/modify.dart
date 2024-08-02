import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/employee.dart';
modifySalary(){
  
PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new salary :');
double salary = double.parse(stdin.readLineSync().toString().trim());

if (Employee.info.containsKey(name)) {
  //salary index = 0  VVV
  Employee.info[name]![0]='Salary : $salary';
  PrintWithColor.green('Done');
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}