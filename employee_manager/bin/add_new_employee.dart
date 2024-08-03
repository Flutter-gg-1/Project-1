import 'global_variabels.dart';
import './display_all_employee.dart';

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
