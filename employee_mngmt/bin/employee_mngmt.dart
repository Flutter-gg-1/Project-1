import 'dart:io';
import 'employee.dart';
import 'exit_method.dart';

void main(List<String> arguments) {
  bool isExit = false;
  do {
    print('\n---Welcome to The Employee Management System---');

    // print('Enter your Login credentials: ');
    // stdout.write('ID: ');
    // String id = stdin.readLineSync()!;
    // stdout.write('password: ');
    // String password = stdin.readLineSync()!;
    // print('\n---Welcome username---');

    Employee? registeredUser;

    if (Employee.permissionList.contains(registeredUser)) {
      print('1: Add Employee');
      print('2: View information');
      print('3: Update Salary');
      print('4: Set Permissoins');
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
          stdout.write('Enter Employee ID');
          String? empID = stdin.readLineSync();
          Employee.viewInfo(Employee.getEmployee(empID!));
        case '3':
          stdout.write('Enter Employee ID');
          String? empID = stdin.readLineSync();
          stdout.write('Enter New Salary');
          int? salary = int.parse(stdin.readLineSync()!);
          Employee.setSalary(Employee.getEmployee(empID!)!, salary);
        case '4':
          stdout.write('Enter Employee ID');
          String? empID = stdin.readLineSync();
          stdout.write(
              'Are you sure you want to give permission to Employee $empID? y/n');
          String? answer = stdin.readLineSync();
          if (answer!.toLowerCase() == 'y') {
            Employee.addToPermission(Employee.getEmployee(empID!)!);
          }
        case '0' || '':
        isExit = exitMethod();
        default:
      }
    } else {
      print('1: View my Information');
      print('2: Set password');
      print('3: View Department ID');
      print('0: Exit');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
        case '2':
        case '3':
        case '0' || '':
        default:
      }
    }
  } while (!isExit);
}
