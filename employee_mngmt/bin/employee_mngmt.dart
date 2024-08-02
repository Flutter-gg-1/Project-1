import 'dart:io';
// import 'employee.dart';

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

    if (1 == 1) {
      print('1: View information');
      print('2: Add employee');
      print('3: Set Salary');
      print('4: Set Permissoins');
      print('0: Exit');

      stdout.write('\nEnter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
        case '2':
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
