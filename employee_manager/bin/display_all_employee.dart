import './global_variabels.dart';

displayAllEmployee(List<Map<String, dynamic>> getEmployees) {
  for (var element in getEmployees) {
    /*
    In our working system 

    Housing allowance : 25% of basic salary
    Transport allowance : 10% of basic salary
    General Organization for Social Insurance (GOSI) : 9.75% of Basic salary & Housing allowance

    */
    double housingAllowance = (element["basic_salary"] * 0.25);
    double transportAllowance = (element["basic_salary"] * 0.10);
    double gosi = ((element["basic_salary"] + housingAllowance) * 0.0975);

    element["housing_allowance"] = housingAllowance;
    element["transport_allowance"] = transportAllowance;
    element["gosi"] = gosi;

    // totall salary before deduction from GOSI
    double totalSalaryBeforeGosi = element["basic_salary"] +
        element["housing_allowance"] +
        element["transport_allowance"] +
        element["other_allowances"];

    // totall salary after deduction from GOSI
    double totalSalaryAfterGosi = (element["basic_salary"] +
            element["housing_allowance"] +
            element["transport_allowance"] +
            element["other_allowances"]) -
        element["gosi"];

    element["total_salary_before_gosi"] = totalSalaryBeforeGosi;
    element["total_salary_after_gosi"] = totalSalaryAfterGosi;

    print("\n\n\n\n");

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
Employee permssion                | ${element["employee_permssion"] == 1 ? empPermission[0] : empPermission[1]}
********************************************************************************
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

''');
  }
}
