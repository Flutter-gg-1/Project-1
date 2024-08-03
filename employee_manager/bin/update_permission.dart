import 'dart:io';

import 'global_variabels.dart';
import './display_all_employee.dart';
import 'home.dart';

updateEmployeePermission({required String employeeID}) {
  List<Map<String, dynamic>> getEmployee = [];
  for (var i = 0; i < allEmployee.length; i++) {
    if (employeeID.toString() == allEmployee[i]["id"].toString()) {
      getEmployee.add(allEmployee[i]);
      displayAllEmployee(getEmployee);
      Home.employeeUpdatePermission();
      var str = stdin.readLineSync();
      switch (str) {
        case '1':
          print("Are you sure to change the permission ?(Y:Yes,other:No)");
          String checkPermission = stdin.readLineSync()!;
          if (checkPermission == "Y" || checkPermission == "y") {
            getEmployee[0]["employee_permssion"] = 1;

            print("Permission Updated To Admin :)");
          } else {
            print("O_O! Nothing to do it.");
          }

        case '2':
          print("Are you sure to change the permission ?(Y:Yes,other:No)");
          var checkPermission = stdin.readLineSync();
          if (checkPermission == "Y" || checkPermission == "y") {
            getEmployee[0]["employee_permssion"] = 2;

            print("Permission Updated To User :)");
          } else {
            print("O_O! Nothing to do it.");
          }
        default:
          Home.instruction();
      }
    } else {
      print("O_O!No id founded");
    }
  }
}
