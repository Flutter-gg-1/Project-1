import 'dart:io';

import '../function/modify_employee/add.dart';
import '../function/modify_employee/remove.dart';
import '../function/modify_employee/modify.dart';
import '../function/track_employee/display.dart';
import '../function/track_employee/log.dart' as log;
import '../utlis/print_with_color.dart';
class Employee{

static Map<String,List> info= {};

addEmployee(){
  PrintWithColor.blue('=============add a new emplyee==========');
  add();
  PrintWithColor.blue('========================================');
  stdin.readLineSync();
}


removeEmployee(){
  PrintWithColor.red('=============remove emplyee==========');
  remove();
  PrintWithColor.red('=====================================');
  stdin.readLineSync();
}


modifyEmployee(){
  PrintWithColor.blue('=============updating salary==========');
  modifySalary();
  PrintWithColor.blue('======================================');
  stdin.readLineSync();
}
diseplayEmployee(){
  PrintWithColor.blue('=============Employees==========');
  display();
  PrintWithColor.blue('================================');
  stdin.readLineSync();
}

diseplayEmployeeLog(){
  PrintWithColor.blue('=========Employees Log==========');

  PrintWithColor.green('enter the name : ');
  String name =stdin.readLineSync().toString().trim();
 

  //use clausers to check if the emplyee log exiest
  log.Track.printLog(name: name,callback: (p0) {
    if (log.Track.log.containsKey(name)) {
      for (var element in p0) {
        PrintWithColor.purple(element);
      }
    } else {
      PrintWithColor.red('Employee log not found');
    }
  },);

  PrintWithColor.blue('================================');
  stdin.readLineSync();
}
}