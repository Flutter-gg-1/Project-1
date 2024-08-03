import 'dart:io';
import 'dart:convert';
import '../employee.dart';
import '../employee_mngmt.dart';

readFiles(List<dynamic> files) {
  File empFile = File('bin/lists/employee.json');
  String employees = empFile.readAsStringSync();
  List<dynamic> temp = jsonDecode(employees);

  for (var i = 0; i < temp.length; i++) {
    Employee.listOfEmployees.add(Employee.fromMap(temp[i]));
  }

  files.add(temp);
  temp.clear;

  empFile = File('bin/lists/login.json');
  String loginInfo = empFile.readAsStringSync();
  temp = jsonDecode(loginInfo);

  files.add(temp);
  temp.clear;

  empFile = File('bin/lists/permission.json');
  String permissions = empFile.readAsStringSync();
  temp = jsonDecode(permissions);

  files.add(temp);
  temp.clear;
}

Future<void> updateEmployeeList(Employee emp,
    {Map<String, dynamic>? updatedInfo}) async {
  //Update employee.json

  Map<String, dynamic> newEmployee = {
    'firstName': emp.firstName,
    'lastName': emp.lastName,
    'empID': emp.empID,
    'nationality': Employee.nationality,
    'role': emp.role,
    'dateOfBirth': emp.dateOfBirth,
    'gender': emp.gender,
    'phoneNumber': emp.phoneNumber,
    'email': emp.email,
    'address': emp.address,
    'department': emp.dept,
    'jobDescription': emp.jobDescription,
    'salary': emp.salary,
  };

  File file = File('bin/lists/employee.json');
  String records = file.readAsStringSync();
  List temp = jsonDecode(records);

  // update existing employee
  bool found = false;
  for (int i = 0; i < temp.length; i++) {
    if (temp[i]['empID'] == emp.empID) {
      temp[i] = updatedInfo;
      found = true;
      break;
    }
  }

  //update json file
  if (!found) {
    temp.add(newEmployee);
  }
  String update = jsonEncode(temp);
  file.writeAsStringSync(update, mode: FileMode.write);
}

void updateEmployeeInJson(Employee emp, String empID) {
  File file = File('bin/lists/employee.json');
  String records = file.readAsStringSync();
  List<dynamic> employees = jsonDecode(records);

  for (var i = 0; i < employees.length; i++) {
    if (employees[i]['empID'] == empID) {
      Map<String, dynamic> updatedInfo =
          Employee.fillEmployeeInformation(empID);
      Employee.updateEmployee(emp, updatedInfo);
      updateEmployeeList(Employee.getEmployee(empID)!,
          updatedInfo: updatedInfo);
      print('\nEmployee Information updated successfully!!');
      break;
    }
  }
  readFiles(listOfFiles);
}
