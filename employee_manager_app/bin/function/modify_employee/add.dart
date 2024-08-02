import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/employee.dart';
add(){
PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();
PrintWithColor.green('enter the salary :');
double salary = double.parse(stdin.readLineSync().toString().trim());
PrintWithColor.green('enter the job description :');
String jobDescription = stdin.readLineSync().toString().trim();
PrintWithColor.green('enter the permission :');
String permission = stdin.readLineSync().toString().trim();

Employee.info.addAll({
  name:[
    'Salary : $salary',
    'job description : $jobDescription',
    'permission : $permission'
    ]});
    PrintWithColor.green('Employee $name has been created with info :');
    print('${Employee.info[name]}');   
}