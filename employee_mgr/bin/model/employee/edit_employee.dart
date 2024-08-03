import 'dart:io';

import '../../mock_storage/storage.dart';
import '../../utils/colorful_print.dart';
import '../enums/employee_fields.dart';
import '../enums/employee_role.dart';
import 'employee.dart';
import 'validation_employee.dart';

extension EditEmployee on Employee {
  void addNew(
      {required String newName,
      required String newPhone,
      required int newAge,
      required double newSalary,
      required String newRole}) {
    validateNewName(newName);
    validateNewPhone(newPhone);
    validateAge('$newAge');
    validateSalary('$newSalary');
    validateRole(newRole);
  }

  void editDetails() {
    var shouldExit = false;
    do {
      ColorfulPrint.magenta('Edit Details of $name. "id#: $id"');
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
    var currentUser = Storage.shared.currentUser!;
    var shouldExit = false;
    switch (userInput) {
      case '1':
        editField(fieldName: EmployeeFields.name);
      case '2':
        editField(fieldName: EmployeeFields.phone);
      case '3':
        editField(fieldName: EmployeeFields.age);
      case '4':
        (currentUser.role == EmployeeRole.manager)
            ? currentUser.id == id
                ? print('You cannot change your own Salary!')
                : editField(fieldName: EmployeeFields.salary)
            : ColorfulPrint.red(
                'You do not have Access Rights to edit this field');
      case '5':
        (currentUser.role == EmployeeRole.manager)
            ? currentUser.id == id
                ? print('You cannot change your own Role!')
                : editField(fieldName: EmployeeFields.role, selectionEdit: true)
            : ColorfulPrint.red(
                'You do not have Access Rights to edit this field');
      case '6':
        (currentUser.role == EmployeeRole.manager)
            ? currentUser.id == id
                ? print('You cannot DeActivate your self!')
                : editField(
                    fieldName: EmployeeFields.activeState, selectionEdit: true)
            : ColorfulPrint.red(
                'You do not have Access Rights to edit this field');
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
