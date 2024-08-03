import '../../utils/colorful_print.dart';
import '../enums/employee_role.dart';
import '../enums/employee_status.dart';
import 'employee.dart';

// Functions For Data Validation
extension ValidationEmployee on Employee {
  void validateNewName(String newName) {
    if (newName.isEmpty) {
      ColorfulPrint.red('ERROR: Name Cannot be empty!');
    } else {
      name = newName;
      ColorfulPrint.green('Name: $name is a valid entry');
    }
  }

  void validateNewPhone(String newPhone) {
    try {
      newPhone = newPhone.replaceAll(' ', '').replaceAll('\n', '');
      var _ = int.parse(newPhone);
      if (newPhone.length != 10) {
        ColorfulPrint.red('ERROR: Entry is not 10 digits');
      } else {
        phoneNum = newPhone;
        ColorfulPrint.green('Phone: ${phoneStr()} is a valid entry');
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Entry contains non-digit characters!');
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
        ColorfulPrint.green('Age: $age is a valid entry');
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Entry contains non-digit characters!');
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
        ColorfulPrint.green('Salary ${salaryStr()} is a valid entry');
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Entry is not a number!');
    }
  }

  void validateRole(String newRole) {
    switch (newRole) {
      case '1':
        role = EmployeeRole.employee;
        ColorfulPrint.green('New Role selection is ${role.name}');
      case '2':
        role = EmployeeRole.manager;
        ColorfulPrint.green('New Role selection is ${role.name}');
      default:
        ColorfulPrint.red('ERROR: Invalid Input');
    }
  }

  void validateActiveState(String newState) {
    switch (newState) {
      case '1':
        state = EmployeeStatus.active;
        ColorfulPrint.green('New State selection is ${state.name}');
      case '2':
        state = EmployeeStatus.inActive;
        ColorfulPrint.green('New State selection is ${state.name}');
      default:
        ColorfulPrint.red('ERROR: Invalid Input');
    }
  }
}
