import'dart:io';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/storage.dart';
import'../track_employee/log.dart' as log;
remove(){

PrintWithColor.green('enter the neme :');
String name = stdin.readLineSync().toString().trim();

Storage.info.remove(name);

PrintWithColor.red('Employee $name has been removed');
log.Track.addToLog(name: name, opration: 'emplyee removed');
}