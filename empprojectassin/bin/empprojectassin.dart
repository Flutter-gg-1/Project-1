import 'dart:io';
import 'add_employee.dart';
import 'display_emp_info.dart';
import 'data_list.dart';
import 'pannel_emp.dart';

void main() {
  bool isExit = false;

  do {
    pannel();
    var inputUser = stdin.readLineSync();
    switch (inputUser) {
      case '0':
        print('Write Employee Name');
        inputUser = stdin.readLineSync();
        addEmployee(name: inputUser!);
        break;
      case '1':
        break;
      case '2':
        break;
      case '3':
        displayInfo(displayListInfo: empData);
        break;
      //Exit
      case 'q' || 'Q':
        isExit = true;
        break;
      default:
        print('please only write the showing number');
    }
  } while (!isExit);
}
