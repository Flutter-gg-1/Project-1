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

    print('1: Login');
    print('2: Deposit');
    print('3: Check balance');
    print('4: View transactions');
    print('5: Open a new account');
    print('6: Remove account');
    print('7: View UserInfo');
    print('0: Exit');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == null || choice.isEmpty) {
      print('Invalid input!!');
      continue;
    }

    switch (choice) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '0':
      default:
        print('Invalid choice!!');
    }
  } while (!isExit);
}
