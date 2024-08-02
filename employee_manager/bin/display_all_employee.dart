displayAllEmployee(List<Map<String, dynamic>> getEmployees) {
  for (var element in getEmployees) {
    print("\n\n\n\n");

    print("                         Display all employee             ");
    print('''
********************************************************************************
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Employee ID                       | ${element["id"]} 
Employee Name                     | ${element["employee_name"]} 
Employee National ID              | ${element["national_id"]} 
Employee Basic Salary             | ${element["basic_salary"]} SAR
Employee Housing Allownce         | ${element["housing_allowance"]} SAR
Employee Transport Allownce       | ${element["transport_allowance"]} SAR 
Employee Other Allownce           | ${element["other_allowances"]} SAR
Employee GOSI                     | ${element["gosi"]} SAR
Employee total salary before GOSI | ${element["total_salary_before_gosi"]} SAR
Employee total salary after GOSI  | ${element["total_salary_after_gosi"]} SAR 
Employee Job Title                | ${element["job_title"]} 
Employee Job Description          | ${element["job_description"]} 
********************************************************************************
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

''');
  }
}
