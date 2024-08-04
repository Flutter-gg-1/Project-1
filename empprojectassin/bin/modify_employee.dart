import 'dart:io';
import 'data_list.dart';
import 'pannel_emp.dart';
import 'colors.dart';

// function to Modify Employee ->Salary\Description\Permission
updateEmployee(String inputID) {
  if (inputID != 'null') {
    bool isExit = false;

    Map<String, dynamic> copyOfData = {};

    copyOfData = empData[int.parse(inputID)];
    do {
      //display modify pannel
      modifyPannel();

      var inputUser = stdin.readLineSync();
      switch (inputUser) {
        //###########Modify Salary
        case '0':
          double newSalary;
          print(
              'Employee: ${copyOfData["empName"]} new Salary most be above 3000: ');
          newSalary = double.parse(stdin.readLineSync()!);
          if (newSalary > 3000 || newSalary < 50000) {
            copyOfData['salary'] = newSalary;
            print('Salary changed successfully');
          } else {
            print('most be above 3000 \x1B[0m');
          }
          break;
        //###########Modify Description
        case '1':
          print('Employee: ${copyOfData["empName"]} new Description is: ');
          copyOfData['description'] = inputUser = stdin.readLineSync();
          print('Description changed successfully');
          break;
        //###########Modify Permission
        case '2':
          print('Employee: ${copyOfData["empName"]} new permission is: ');
          permissionsPannel();
          String permission = stdin.readLineSync()!;
          switch (permission) {
            case '0':
              permission = 'admin';
              break;
            case '1':
              permission = 'Assistant';
              break;
            case '2':
              permission = 'Employeer';
            default:
              print('nothing change only choose 0/1/2');
          }
          copyOfData['permission'] = permission;
          print('permission changed successfully');
          break;
        //###############Exit
        case 'q' || 'Q':
          isExit = true;
          break;
        default:
          print('$redBG please only write the showing number\x1B[0m');
      }
      empData[int.parse(inputID)] = copyOfData;
    } while (!isExit);
  } else {
    print(
        '\n\n\n\n\n $redBG no Employee found & make sure there is Employees\x1B[0m');
  }
}
