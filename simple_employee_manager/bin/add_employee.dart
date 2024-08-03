import 'dart:io';
import 'dart:math';
import 'employees_list.dart';

// this function is used for add new employee
addEmployee({
  required String? name,
  required int salary,
  required String? description,
  required Set<String> permissions,
}) {
  //Variables and Constants
  final String? employeeName = name;
  final String employeeId = "${Random().nextInt(1000)}";
  int employeeSalary = salary;
  Set<String> employeePermissions = permissions;
  String? jobDescription = description;
  final String startDate = DateTime.now().toString();
  const int workDays = 5;

  //map contain employee data
  Map<String, dynamic> employeeMap = {
    "employee_name": employeeName,
    "employee_id": employeeId,
    "employee_salary": employeeSalary,
    "employee_permissions": employeePermissions,
    "job_description": jobDescription,
    "start_date": startDate,
    "work_day": workDays,
  };
  //add employee data to all employes list
  employeesList.add(employeeMap);
  print(
      "*** Employee add successfully *** \n \n Employee ID is ***** $employeeId *****");
  //for new line after display
  stdin.readLineSync();
}
