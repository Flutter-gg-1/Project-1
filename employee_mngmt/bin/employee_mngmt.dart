import 'dart:io';
import 'employee.dart';
import 'exit_method.dart';
import '../login/logging_in.dart';

void main(List<String> arguments) async {
  bool isExit = false;

  do {
    String userID = await login();

    if (userID == '0') {
      continue;
    }

    if (userID == '1000') {
      print('1: Add Employee');
      print('2: Choose Employee');
      print('0: Exit');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          print('To add a new Employee, complete the following');
          String? firstName;
          String? lastName;
          String? role;

          stdout.write('First Name: ');
          firstName = stdin.readLineSync();
          stdout.write('Last Name: ');
          lastName = stdin.readLineSync();
          stdout.write('Role: ');
          role = stdin.readLineSync();

          Employee(firstName: firstName, lastName: lastName, role: role);

        case '2':
          stdout.write('Enter Employee ID: ');
          String? empID = stdin.readLineSync();

          print('1: \nView information');
          print('2: Update Salary');
          print('3: Set Permissoins');

          stdout.write('\nEnter your choice: ');
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              Employee.viewInfo(Employee.getEmployee(empID!));
            case '2':
              stdout.write('Enter New Salary: ');
              int? salary = int.parse(stdin.readLineSync()!);
              Employee.setSalary(Employee.getEmployee(empID!)!, salary);
              print('Salary has been updated.');
            case '3':
              stdout.write(
                  'Are you sure you want to give permission to Employee $empID? y/n: ');
              String? answer = stdin.readLineSync();
              if (answer!.toLowerCase() == 'y') {
                Employee.addToPermission(Employee.getEmployee(empID!)!);
                print('Employee added to the list of Permissoins.');
              }
          }

        case '0' || '':
          isExit = exitMethod();
        default:
      }
    } else {
      print('1: View my Information');
      print('2: Set password');
      print('3: View Department ID');
      print('0: Exit\n');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          Employee.viewInfo(Employee.getEmployee(userID));
        case '2':
          Employee.setPassword(Employee.getEmployee(userID)!);
        case '3':
          print(
              'Department Id = ${Employee.getEmployee(userID)!.dept!.deptName}');
        case '0' || '':
          isExit = exitMethod();
        default:
      }
    }
  } while (!isExit);
}
