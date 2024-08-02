import 'dart:math';                   // library used to generate random employee id
import 'get_input_name.dart';         // function to get name input from user
import 'get_input_salary.dart';       // function to get salary input from user
import 'get_input_job_desc.dart';     // function to get job description input from user
import 'get_input_permissions.dart';  // function to get permissions input from user
import 'package:employee_manager/models/employee.dart'; // employee class

// function to add a new employee
List addEmployee({required Map<int, Employee> employees}) {
  // generate employee id
  int id = Random().nextInt(9999999);

  // generate new id if id already exists
  while (employees.containsKey(id)) {
    id = Random().nextInt(9999999);
  }

  // get employee info
  String name = getInputName();
  double salary = getInputSalary();
  String jobDesc = getInputJobDesc();
  List permissions = getInputPermissions(name: name);

  // create an instance of class employee with above inputs
  Employee employee = Employee(id: id, name: name, salary: salary, jobDesc: jobDesc, permissions: permissions);

  // return the two values to be added to the employees map
  return [id, employee];
}
