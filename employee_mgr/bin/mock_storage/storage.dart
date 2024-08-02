import '../model/employee.dart';
import '../model/employee_role.dart';

class Storage {
  // Employee? currentUser;

  var employees = [
    Employee(name: 'John Doe', phoneNum: 1235557799, age: 24, salary: 4320.64),
    Employee(
        name: 'Richard Smith',
        phoneNum: 1234446688,
        age: 32,
        salary: 4320.64,
        role: EmployeeRole.manager),
  ];
}
