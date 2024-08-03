import 'dart:io';
import 'accounts.dart';
import 'colors.dart';

modify() {
  stdout.write("Enter ID: ");
  int? userInputID = int.tryParse(stdin.readLineSync()!);
  if (userInputID == null) {
    // Meaning if input isn't a number , like string
    print("Invalid input. ");
    stdin.readLineSync();
    return;
  }
  bool isLoggedIn = false;
  for (var element in accounts) {
    if (userInputID == element["id"]) {
      isLoggedIn = true;
    }
  }
  if (isLoggedIn) {
    print('$brightYellow 1. Edit Salary$reset');
    print('$brightYellow 2. Edit Job Title\n$reset');
    int? userInput = int.tryParse(stdin.readLineSync()!);
    if (userInput == null) { // If not a number
      print("Invalid Input. ");
      return;
    }
    switch (userInput) {
      case 1: // Edit Salary
      stdout.write("New Salary >> ");
        int? inputSalary = int.tryParse(stdin.readLineSync()!);
        if (inputSalary == null) {
          print("Invalid Input");
          return;
        } 
        accounts[userInputID - 1]['salary'] = inputSalary;
        break;
      case 2: // Edit Job Title
      stdout.write("New Job Title >> ");
        String? inputJob = stdin.readLineSync()!;
        accounts[userInputID - 1]['jobTitle'] = inputJob;
      default:
        print("Invalid Input. ");
    }
  } else {
    print("Wrong ID");
    stdin.readLineSync();
  }
}
