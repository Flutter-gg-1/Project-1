import 'dart:io';

import '../model/employee.dart';
import '../model/enums/employee_role.dart';
import '../utils/colorful_print.dart';

class Storage {
  Employee? currentUser;

  var employees = [
    Employee(name: 'John Doe', phoneNum: 1235557799, age: 24, salary: 4320.64),
    Employee(
        name: 'Richard Smith',
        phoneNum: 1234446688,
        age: 32,
        salary: 7810.64,
        role: EmployeeRole.manager),
  ];

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
}
