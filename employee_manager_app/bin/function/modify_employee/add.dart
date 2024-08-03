import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/storage.dart';
import'../track_employee/log.dart' as log;
add(){
PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();
PrintWithColor.green('enter the salary :');
double salary = double.parse(stdin.readLineSync().toString().trim());
PrintWithColor.green('enter the job title :');
String jobTitle = stdin.readLineSync().toString().trim();
PrintWithColor.green('enter the job description :');
String jobDescription = stdin.readLineSync().toString().trim();
PrintWithColor.green('enter the permission :');
String permission = stdin.readLineSync().toString().trim();

Storage.info.addAll({
  name:[
    'Salary : $salary',
    'Job title : $jobTitle',
    'Job description : $jobDescription',
    'Permission : $permission'
    ]});
    log.Track.addToLog(name: name, opration:'add a new employee'); 
    PrintWithColor.green('Employee $name has been created with info :');
    print('${Storage.info[name]}');    

}