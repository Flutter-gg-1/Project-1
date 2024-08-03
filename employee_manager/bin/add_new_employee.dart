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
      double housingAllowance = (element["basic_salary"] * 0.25);
      double transportAllowance = (element["basic_salary"] * 0.10);
      double gosi = ((element["basic_salary"] + housingAllowance) * 0.0975);
      element["id"] = startID++;
      element["housing_allowance"] = housingAllowance;
      element["transport_allowance"] = transportAllowance;
      element["gosi"] = gosi;
      double totalSalaryBeforeGosi = element["basic_salary"] +
          element["housing_allowance"] +
          element["transport_allowance"] +
          element["other_allowances"];

      element["total_salary_before_gosi"] = totalSalaryBeforeGosi;
      double totalSalaryAfterGosi = (element["basic_salary"] +
              element["housing_allowance"] +
              element["transport_allowance"] +
              element["other_allowances"]) -
          element["gosi"];
      element["total_salary_after_gosi"] = totalSalaryAfterGosi;
      displayAllEmployee(newEmployee);
      allEmployee.add(element);
    } else {
      print("O_O! No data");
    }
  }
}
