import 'dart:io';
import 'employee.dart';

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
      print('1: View information');
      print('2: Add employee');
      print('3: Set Salary');
      print('4: Set Permissoins');
      print('0: Exit');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter Employee ID');
          String? empID = stdin.readLineSync();
          Employee? emp;
          for (int i = 0; i < Employee.listOfEmployees.length; i++) {
            if (Employee.listOfEmployees[i].empID == empID) {
              emp = Employee.listOfEmployees[i];
            }
          }
          Employee.viewInfo(emp!);
        case '2':
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
        case '3':
        case '4':
        case '0' || '':
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
