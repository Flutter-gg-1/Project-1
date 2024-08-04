import 'dart:io';
import 'add_employee.dart';
import 'display_emp_info.dart';
import 'data_list.dart';
import 'pannel_emp.dart';
import 'colors.dart';
import 'modify_employee.dart';
import 'get_id.dart';

/*
Student: Anas Oudah Aljuhani

professional trainer:
-Fahad
-Mjd

*/
void main() {
  bool isExit = false;
  //const wlecoming msg
  const welcomeMessage = 'Welcome to Employee Manager!';
  print('\n\n\n\n' * 3);
  print("|$magentaBG&--->$welcomeMessage<---&   \x1B[0m   |");
  do {
    //dispaly pannle
    pannel();
    var inputUser = stdin.readLineSync();
    switch (inputUser) {
      //####### add employee
      case '0':
        print('Write Employee Name');
        inputUser = stdin.readLineSync();
        //add function
        addEmployee(name: inputUser!);
        break;
      //####### modify employee
      case '1':
        updateEmployee(getIndexList(empData));
        break;
      //####### display employee
      case '2':
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
