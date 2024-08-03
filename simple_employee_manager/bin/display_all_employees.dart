import 'dart:io';

//this function praint all employees
void displayAllEmployee(
    {required List<Map<String, dynamic>> employeesDisplay}) {
  //variable for count nuber of employee
  int count = 1;
  print("\n");
  print("************************** All employees **************************");
  print("\n");
  //loop print each employee data
  for (var element in employeesDisplay) {
    print("Employee number $count");
    print(
        "__________________________________________________________________\n");
    print("* Employee name is  ${element["employee_name"]}");
    print("* Employee ID is  ${element["employee_id"]}");
    print("* Employee salary is  ${element["employee_salary"]}");
    print("* Employee permissions is  ${element["employee_permissions"]}");
    print("* Employee job description is  ${element["job_description"]}");
    print(
        "__________________________________________________________________\n");
    count++;
  }
  print("Total number of employees is ${count -1}");
  //for new line after display
  stdin.readLineSync();
}
