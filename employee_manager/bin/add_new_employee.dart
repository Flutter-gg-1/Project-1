import 'dart:io';

import 'global_variabels.dart';
import './display_all_employee.dart';
import 'home.dart';

addNewEmployee({
  required String empName,
  required String nationaID,
  required String dateOfBirth,
  required String jobTitle,
  required String jobDescription,
  required int basicSalary,
  double otherAllowances = 0.0,
}) {
  List<Map<String, dynamic>> newEmployee = [
    {
      "id": startID++,
      "employee_name": empName,
      "Date_of_birth": dateOfBirth,
      "national_id": nationaID,
      "basic_salary": basicSalary,
      "other_allowances": otherAllowances,
      "job_title": jobTitle,
      "job_description": jobDescription
    }
  ];

  for (var element in newEmployee) {
    if (element["employee_name"] != "" ||
        element["Date_of_birth"] != "" ||
        element["national_id"] != "" ||
        element["basic_salary"] != "" ||
        element["other_allowances"] != "" ||
        element["job_title"] != "" ||
        element["job_description"] != "") {
      element["id"] = startID++;
      displayAllEmployee(newEmployee);
      allEmployee.add(element);
    } else {
      print("O_O! No data");
    }
  }
}

inputNewEmployee() {
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
  var inputEmployeeJBasicSalary = int.parse(stdin.readLineSync().toString());
  print("Employee Other Allowance :");
  double inputEmployeeJOtherAllowance = double.parse(stdin.readLineSync()!);
  if (inputEmployeeName != "" &&
      inputNationalID != "" &&
      inputEmployeeDateOfBirth != "" &&
      inputEmployeeJobTitle != "" &&
      inputEmployeeJobDescription != "" &&
      inputEmployeeJBasicSalary > 0 &&
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
    Home.instruction();
  }
}
