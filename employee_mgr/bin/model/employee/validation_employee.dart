import '../../utils/colorful_print.dart';
import '../enums/employee_role.dart';
import '../enums/employee_status.dart';
import 'employee.dart';

// Functions For Data Validation
extension ValidationEmployee on Employee {
  bool validateNewName(String newName) {
    if (newName.isEmpty) {
      ColorfulPrint.red('ERROR: Name Cannot be empty!');
      return false;
    } else {
      name = newName;
      ColorfulPrint.green('Name: $name is a valid entry');
      return true;
    }
  }

  bool validateNewPhone(String newPhone) {
    try {
      newPhone = newPhone.replaceAll(' ', '').replaceAll('\n', '');
      var _ = int.parse(newPhone);
      if (newPhone.length != 10) {
        ColorfulPrint.red('ERROR: Phone Entry is not 10 digits');
        return false;
      } else {
        phoneNum = newPhone;
        ColorfulPrint.green('Phone: ${phoneStr()} is a valid entry');
        return true;
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Phone Entry contains non-digit characters!');
      return false;
    }
  }

  bool validateAge(String newAge) {
    try {
      newAge = newAge.replaceAll(' ', '').replaceAll('\n', '');
      var value = int.parse(newAge);
      if (value < 10 || value > 80) {
        ColorfulPrint.red('ERROR: Age must be between 10 and 80');
        return false;
      } else {
        age = value;
        ColorfulPrint.green('Age: $age is a valid entry');
        return true;
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Age contains non-digit characters!');
      return false;
    }
  }

  bool validateJobDesc(String newJobDesc) {
    if (newJobDesc.isEmpty) {
      ColorfulPrint.red('ERROR: Job Desc. Cannot be empty!');
      return false;
    } else {
      jobDescription = newJobDesc;
      ColorfulPrint.green('Job Desc.: $jobDescription is a valid entry');
      return true;
    }
  }

  bool validateSalary(String newSalary) {
    try {
      newSalary = newSalary.replaceAll(' ', '').replaceAll(',', '');
      var value = double.parse(newSalary);
      if (value < 500 || value > 100000) {
        ColorfulPrint.red('ERROR: Salary must be between 500 and 100,000');
        return false;
      } else {
        salary = value;
        ColorfulPrint.green('Salary ${salaryStr()} is a valid entry');
        return true;
      }
    } catch (_) {
      ColorfulPrint.red('ERROR: Salary is not a number!');
      return false;
    }
  }

  bool validateRole(String newRole) {
    switch (newRole) {
      case '1':
        role = EmployeeRole.employee;
        ColorfulPrint.green('New Role selection is ${role.name}');
        return true;
      case '2':
        role = EmployeeRole.manager;
        ColorfulPrint.green('New Role selection is ${role.name}');
        return true;
      default:
        ColorfulPrint.red('ERROR: (Role) Invalid Input');
        return false;
    }
  }

  bool validateActiveState(String newState) {
    switch (newState) {
      case '1':
        state = EmployeeStatus.active;
        ColorfulPrint.green('New State selection is ${state.name}');
        return true;
      case '2':
        state = EmployeeStatus.inActive;
        ColorfulPrint.green('New State selection is ${state.name}');
        return true;
      default:
        ColorfulPrint.red('ERROR: (Active State) Invalid Input');
        return false;
    }
  }
}
