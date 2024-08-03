import '../utils/colorful_print.dart';
import 'employee.dart';
import 'enums/employee_role.dart';
import 'enums/employee_status.dart';

// Functions For Data Validation
extension ValidationEmployee on Employee {
  void validateNewName(String newName) {
    if (newName.isEmpty) {
      ColorfulPrint.red('ERROR: Name Cannot be empty!');
    } else {
      name = newName;
      ColorfulPrint.green('Name updated successfully to $name');
    }
  }

  void validateNewPhone(String newPhone) {
    try {
      newPhone = newPhone.replaceAll(' ', '').replaceAll('\n', '');
      var value = int.parse(newPhone);
      if (newPhone.length != 10) {
        ColorfulPrint.red('ERROR: Entry is not 10 digits');
      } else {
        phoneNum = value;
        ColorfulPrint.green('Phone updated successfully to ${phoneStr()}');
      }
    } catch (_) {
      print('ERROR: Entry contains non-digit characters!');
    }
  }

  void validateAge(String newAge) {
    try {
      newAge = newAge.replaceAll(' ', '').replaceAll('\n', '');
      var value = int.parse(newAge);
      if (value < 10 || value > 80) {
        ColorfulPrint.red('ERROR: Enter a number between 10 and 80');
      } else {
        age = value;
        ColorfulPrint.green('Age updated successfully to $age');
      }
    } catch (_) {
      print('ERROR: Entry contains non-digit characters!');
    }
  }

  void validateSalary(String newSalary) {
    try {
      newSalary = newSalary.replaceAll(' ', '').replaceAll(',', '');
      var value = double.parse(newSalary);
      if (value < 500 || value > 100000) {
        ColorfulPrint.red('ERROR: Enter a number between 500 and 100,000');
      } else {
        salary = value;
        ColorfulPrint.green('Salary updated successfully to ${salaryStr()}');
      }
    } catch (_) {
      print('ERROR: Entry is not a number!');
    }
  }

  void validateRole(String newRole) {
    switch (newRole) {
      case '1':
        role = EmployeeRole.employee;
        ColorfulPrint.green('Role updated successfully to ${role.name}');
      case '2':
        role = EmployeeRole.manager;
        ColorfulPrint.green('Role updated successfully to ${role.name}');
      default:
        ColorfulPrint.red('ERROR: Invalid Input');
    }
  }

  void validateActiveState(String newState) {
    switch (newState) {
      case '1':
        state = EmployeeStatus.active;
        ColorfulPrint.green('State updated successfully to ${state.name}');
      case '2':
        state = EmployeeStatus.inActive;
        ColorfulPrint.green('State updated successfully to ${state.name}');
      default:
        ColorfulPrint.red('ERROR: Invalid Input');
    }
  }
}
