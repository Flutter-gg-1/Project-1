import 'dart:io';
import './storage.dart';
import '../function/modify_employee/add.dart';
import '../function/modify_employee/remove.dart';
import '../function/modify_employee/modify.dart';
import '../function/track_employee/display.dart';
import '../function/track_employee/log.dart' as log;
import '../utlis/print_with_color.dart';
class Employee{



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
  PrintWithColor.blue('=============modify emplyee==========');
  modify();
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
  PrintWithColor.green('enter the YOUR name : ');
  String name =stdin.readLineSync().toString().trim();
  PrintWithColor.green('enter the employee name : ');
  String employeeName =stdin.readLineSync().toString().trim();
  
  //use clausers to check if the emplyee log exiest
  log.Track.printLog(employeeName: employeeName,name: name,callback: (p0) {
   if (log.Track.log.containsKey(employeeName)) {
      PrintWithColor.red('$employeeName log :\n');
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