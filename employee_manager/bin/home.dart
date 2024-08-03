import 'dart:io';

import './global_variabels.dart';
import './add_new_employee.dart';
import './display_all_employee.dart';

class Home {
  static void instruction() {
    print('''

    1 | Add new employee
    2 | Display all employees
    3 | Update an employee
    4 | Assign permission to an employee
    C | Exit
  
  
  ''');
  }

  static void userInput(String str) {
    switch (str) {
      case '1':
        print("+++++++++++++++++++++++++++++++");
        print("Add New Employee");
        print("Employee Name :");
        String inputEmployeeName = stdin.readLineSync().toString();
        print("Employee National ID :");
        String inputNationalID = stdin.readLineSync().toString();
        print("Employee National Date of birth :");
        String inputEmployeeDateOfBirth = stdin.readLineSync().toString();
        print("Employee Job Title :");
        String inputEmployeeJobTitle = stdin.readLineSync().toString();
        print("Employee Job Description :");
        String inputEmployeeJobDescription = stdin.readLineSync().toString();
        print("Employee Basic Salary :");
        var inputEmployeeJBasicSalary =
            int.parse(stdin.readLineSync().toString());
        print("Employee Other Allowance :");
        double inputEmployeeJOtherAllowance =
            double.parse(stdin.readLineSync()!);
        if (inputEmployeeName != "" ||
            inputNationalID != "" ||
            inputEmployeeDateOfBirth != "" ||
            inputEmployeeJobTitle != "" ||
            inputEmployeeJobDescription != "" ||
            inputEmployeeJBasicSalary > 0 ||
            inputEmployeeJOtherAllowance >= 0) {
          addNewEmployee(
              empName: inputEmployeeName,
              nationaID: inputNationalID,
              dateOfBirth: inputEmployeeDateOfBirth,
              jobTitle: inputEmployeeJobTitle,
              jobDescription: inputEmployeeJobDescription,
              basicSalary: inputEmployeeJBasicSalary,
              otherAllowances: inputEmployeeJOtherAllowance);
          stdin.readLineSync();
          Home.instruction();
        } else {
          print("PLease fill all fields!");
          print("click 1 to re enter again");
          str = "1";
        }
      case '2':
        displayAllEmployee(allEmployee);
        stdin.readLineSync();

        Home.instruction();

      case '3':
        print("Update an employee");
      case '4':
        print("Assign permission to an employee");
      case 'C':
        print("Exit");
        isExit = true;

      default:
        isExit = true;
    }
  }
}
