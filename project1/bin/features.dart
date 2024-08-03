import 'dart:io';
import 'add_employee.dart';
import 'print_with_color.dart';
import 'modification.dart';
import 'display_employee_data.dart';
import 'list_all_employees.dart';
import 'remove_employee.dart';
import 'exit.dart';

/* 
    This function to show the list of features application
*/
features(){
  bool exitMenu = false;
  do {
    // show application's features
    printWithColor(text: "\t      Aplication features\n", color: 'White');
    printWithColor(text: "[1]  Add new employee ", color: 'Green');
    printWithColor(text: "[2]  Display employee data ", color: 'Green');
    printWithColor(
        text: "[3]  Modify Salary, Job description and permission", color: 'Green');
    printWithColor(text: "[4]  List all employees ", color: 'Green');
    printWithColor(text: "[5]  Delete employee ", color: 'Green');
    printWithColor(text: "[6]  Exit ", color: 'Green');
    printWithColor(
        text: "\n_____________Please choose a number________________",
        color: "Magenta");
    print("\n");
    int userInput = int.parse(stdin.readLineSync()!);
    // select application's feature
    switch (userInput) {
      case 1:
        addEmplyee();
        break;
      case 2:
        print("Enter Employee ID: ");
        int id = int.parse(stdin.readLineSync()!);
        displayEmployeeData(id: id);
        break;
      case 3:
        print("Enter Employee ID: ");
        int id = int.parse(stdin.readLineSync()!);
        modifyEmployeeData(id: id);
        break;
      case 4:
        listAllEmployees(employeelist: employees);
        break;
      case 5:
        print("Enter Employee ID: ");
        int id = int.parse(stdin.readLineSync()!);
        removeEmployee(id: id);
        break;
        case 6:
        exitMenu = exitApp();
        break;
      default:
        print("Not a valid choice");
        printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
    }
  } while (!exitMenu);
}