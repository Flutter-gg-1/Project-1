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

  // Sign in is simply by entering the employee ID into the console
  // Then assigning the employee to the currentUser var
  void signIn() {
    do {
      fetchAllEmployees();
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

  // Reset the current user
  void signOut() => currentUser = null;

  // Function Logic is in edit_employee.dart
  void editEmployee({required Employee user}) => user.editDetails();

  // Print the list of employees with relevant data
  void fetchAllEmployees({bool isShort = true}) {
    for (var employee in employees) {
      currentUser == null
          ? employee.showEmployeeDeatails(short: isShort)
          : employee.showEmployeeDeatails(
              fullAccess: currentUser!.hasAccess() || employee == currentUser,
              short: isShort);
    }
  }

  // Manager Functions
  void editOtherEmployees() {
    ColorfulPrint.magenta('Select an Employee ID to edit');
  }
}
