import 'dart:io';
import 'add_employee.dart';
import 'assign_permission.dart';
import 'employee_data.dart';
import 'modify_employee.dart';
import 'colors.dart';
import 'employee_list.dart';

void main(List<String> arguments) {
  bool isLoggedIn = false;
  const consoleMsg = "Enter ID: ";
  const invalidMsg = "Invalid Input. ";
  do {
    print('\n\n\n');
    print('$black$brightGreenBG   Welcome to employee manager system   $reset');
    print('$brightBlue 1. Add New Employee$reset');
    print('$brightBlue 2. Assign Permissions$reset');
    print('$brightBlue 3. Display Employee Data$reset');
    print('$brightBlue 4. Modify Salary and Job Description$reset');
    print('$brightBlue 5. List All Employees$reset');
    print('$brightBlue q. Quit$reset');

    String userInput = stdin.readLineSync()!;
    switch (userInput) {
      case "1": // Add Employee
        stdout.write("Enter the name of employee: ");
        String? inputName = stdin.readLineSync()!;
        stdout.write("Enter employee's salary ");
        double? inputSalary = double.tryParse(stdin.readLineSync()!);
        if (inputSalary == null) {
          print(invalidMsg);
          stdin.readLineSync();
          continue;
        }
        stdout.write("Enter job title: ");
        String? userJobTitle = stdin.readLineSync()!;
        addEmployee(
            empName: inputName, empSalary: inputSalary, jobTitle: userJobTitle);
        break;
      case "2": // Assign Permissions to Emplooyes
        givePermission();

        break;
      case "3": // Display Employee Data
        stdout.write(consoleMsg); // Enter ID: 
        int? inputID = int.tryParse(stdin.readLineSync()!);
        if (inputID == null) {
          print(invalidMsg);
          stdin.readLineSync();
          continue;
        }
        displayData(id: inputID);
      case "q" || "Q":
        isLoggedIn = true;
        break;
      case "4": // Edit Salary & Job title
        modify();
      case "5": // Display list of all employees
        employeeList();
      default:
        print(invalidMsg);
    }
  } while (!isLoggedIn);
}
