import 'dart:io';

import '../../utils/colorful_print.dart';
import '../enums/employee_fields.dart';
import 'employee.dart';
import 'validation_employee.dart';

extension EditEmployee on Employee {
  void editDetails() {
    var shouldExit = false;
    do {
      ColorfulPrint.magenta('Edit Details');
      ColorfulPrint.yellow('''
      What would you like to edit?
      Enter the number from the list below:

      1 | Name
      2 | Phone
      3 | Age
      4 | Salary
      5 | Role
      6 | Active State

      b | Back to Home

      ''');

      var userInput = stdin.readLineSync();
      shouldExit = handleUserInput(userInput ?? '');
    } while (!shouldExit);
  }

  bool handleUserInput(String userInput) {
    var shouldExit = false;
    switch (userInput) {
      case '1':
        editField(fieldName: EmployeeFields.name);
      case '2':
        editField(fieldName: EmployeeFields.phone);
      case '3':
        editField(fieldName: EmployeeFields.age);
      case '4':
        editField(fieldName: EmployeeFields.salary);
      case '5':
        editField(fieldName: EmployeeFields.role);
      case '6':
        editField(fieldName: EmployeeFields.activeState);
      case 'b':
        shouldExit = true;
        ColorfulPrint.red('Exiting Edit Menu');
      default:
        print('');
    }
    return shouldExit;
  }

  // Capture User Entry Then call Field Validation
  void editField(
      {required EmployeeFields fieldName, bool selectionEdit = false}) {
    ColorfulPrint.green(
        'Access Granted to change the ${fieldName.name} of $name');
    selectionEdit
        ? fieldName == EmployeeFields.role
            ? ColorfulPrint.magenta(
                'Enter 1 to select Employee, or 2 for Manager')
            : ColorfulPrint.magenta(
                'Enter 1 to select Active, or 2 for InActive')
        : ColorfulPrint.magenta('Enter a new ${fieldName.name}:');

    var userInput = stdin.readLineSync();

    switch (fieldName) {
      case EmployeeFields.name:
        validateNewName(userInput ?? '');
      case EmployeeFields.phone:
        validateNewPhone(userInput ?? '');
      case EmployeeFields.age:
        validateAge(userInput ?? '');
      case EmployeeFields.salary:
        validateSalary(userInput ?? '');
      case EmployeeFields.role:
        validateRole(userInput ?? '');
      case EmployeeFields.activeState:
        validateActiveState(userInput ?? '');
      default:
        print('UNKNOWN ERROR!');
    }
  }
}
