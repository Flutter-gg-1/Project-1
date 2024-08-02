import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/employee.dart';
import'../track_employee/log.dart' as log;
modifySalary(){
  
PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

PrintWithColor.green('enter the new salary :');
double salary = double.parse(stdin.readLineSync().toString().trim());

if (Employee.info.containsKey(name)) {
  //double oldSalary = Employee.info[name]![0];
  //salary index = 0  VVV
  Employee.info[name]![0]='Salary : $salary';
  log.Track.addToLog(name: name, opration: 'Employee salary change  to $salary');
  PrintWithColor.green('Done');
  
}else{
  PrintWithColor.red('there is no employee have a neme $name'); 
}
}