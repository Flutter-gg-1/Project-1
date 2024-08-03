import "dart:io";
import "employees_list.dart";

// this function for print employee data by employee ID
displayEmployee({required String? employeeId}) {
  //create map that will contin employee data
  Map<String, dynamic> employee = {};
  // for loop to find employee account
  for (var element in employeesList) {
    if (element["employee_id"] == employeeId) {
      employee = element;
      break;
    }
  }
  // if employee number exists employee data will be printed
  if (employee.isNotEmpty) {
    print("\n");
    print("* Employee name is  ${employee["employee_name"]}");
    print("* Employee ID is  ${employee["employee_id"]}");
    print("* Employee salary is  ${employee["employee_salary"]}");
    print("* Employee permissions is  ${employee["employee_permissions"]}");
    print("* Employee job description is  ${employee["job_description"]}");
    print("* Employee start date is  ${employee["start_date"]}");
    print("* Employee work day is  ${employee["work_day"]}");
    print("\n");
  } else {
    print("XXXXX Employee ID $employeeId is not found! XXXXX");
  }
  print("Press enter for back to menu");
  stdin.readLineSync();
}
