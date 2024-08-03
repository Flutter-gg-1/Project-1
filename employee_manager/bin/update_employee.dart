import 'dart:io';

import 'global_variabels.dart';
import './display_all_employee.dart';
import 'home.dart';
import './print_with_colors.dart';

updateEmployee({required String employeeID}) {
  List<Map<String, dynamic>> getEmployee = [];
  double newSalary;
  for (var i = 0; i < allEmployee.length; i++) {
    if (employeeID.toString() == allEmployee[i]["id"].toString()) {
      getEmployee.add(allEmployee[i]);
      displayAllEmployee(getEmployee);
      Home.employeeUpdateList();
      var str = stdin.readLineSync();
      switch (str) {
        case '5':
          print("Please enter the new Salary");
          newSalary = double.parse(stdin.readLineSync()!);
          getEmployee[0]["basic_salary"] = newSalary;
          PrintWithColors.green(
              "    |||||||||||||Salary Updated :)|||||||||||||||");
        case '6':
          print("Please enter the new job description");
          String txtDescription = stdin.readLineSync()!;
          getEmployee[0]["job_description"] = txtDescription;
          PrintWithColors.green(
              "    |||||||||||||Salary Updated :)|||||||||||||||");
        default:
          PrintWithColors.red(
              "    |||||||||||||Please choose one of them!|||||||||||||||");
          break;
      }
    } else {
      PrintWithColors.red("    |||||||||||||O_O! No ID found|||||||||||||||");
    }
  }
}
