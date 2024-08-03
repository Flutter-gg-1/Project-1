import 'dart:io';
import '../models/employee.dart';
import './print_with_color.dart';
class Menu{
  Employee system = Employee();
   menu(){
    const instructure = '1| add employee\n2| remove employee\n3| modify employee\n4| display employee\n5| display employee log';
    PrintWithColor.green(instructure);
    PrintWithColor.red('0|exit');
    PrintWithColor.green('\ninput : ');
    String input = stdin.readLineSync().toString().trim();
    PrintWithColor.blue('================================================== \n');
    switch (input) {
      case '1':
        system.addEmployee();
        break;
      case '2':
        system.removeEmployee();
        break;
      case '3':
        system.modifyEmployee();
        break;
      case '4':
        system.diseplayEmployee();
        break;
      case '5':
        system.diseplayEmployeeLog();
        break;
      case '0':
        exit(0);
      default:
    }
  }
}