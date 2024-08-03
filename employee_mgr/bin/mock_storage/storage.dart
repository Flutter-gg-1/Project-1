import 'dart:io';

import '../model/edit_employee.dart';
import '../model/employee.dart';
import '../model/enums/employee_role.dart';
import '../model/enums/employee_status.dart';
import '../utils/colorful_print.dart';

class Storage {
  Employee? currentUser;

  var allEmployees = [
    Employee(name: 'John Doe', phoneNum: 1235557799, age: 24, salary: 4320.64),
    Employee(
        name: 'Richard Smith',
        phoneNum: 1234446688,
        age: 32,
        salary: 7810.64,
        role: EmployeeRole.manager),
    Employee(
        name: 'Jack Sparrow',
        phoneNum: 1234446688,
        age: 23,
        salary: 3564.12,
        role: EmployeeRole.employee,
        status: EmployeeStatus.inActive),
  ];

  late List<Employee> employees;
  late List<Employee> inActiveEmployees;

  Storage() {
    employees = allEmployees
        .where((element) => element.status == EmployeeStatus.active)
        .toList();
    inActiveEmployees = allEmployees
        .where((element) => element.status == EmployeeStatus.inActive)
        .toList();
  }

  void signIn() {
    do {
      for (var employee in employees) {
        employee.showEmployeeDeatails();
      }
      print('Who are you? Enter your ID to login');
      var userInput = stdin.readLineSync();
      var temp = employees.firstWhere((e) => e.id.toString() == userInput!,
          orElse: () => Employee(name: '', phoneNum: -1, age: -1, salary: -1));

      // Check if user exists
      currentUser = temp.name.isEmpty ? null : temp;
      // Show console msg
      currentUser == null
          ? ColorfulPrint.red(
              'ERROR: Could not find an employee with id $userInput')
          : ColorfulPrint.green('Signed in as ${currentUser?.name}');
    } while (currentUser == null);
  }

  void signOut() => currentUser = null;

  void editEmployee({required Employee user}) => user.editDetails();
}
