import 'dart:io';
import 'exit_method.dart';
import 'add_employee.dart';
import 'display_employee.dart';
import 'display_all_employees.dart';
import 'employees_list.dart';
import 'data_updat.dart';

void main() {
  //variable
  bool isExit = false;
  const String message = "* Enter employee ID:";
  do {
    print("\n\n\n\n\n");
    print(" _________________________________________________");
    print("|            Welcome to employee manger           |");
    print("|_________________________________________________|");
    print("\n");
    print("Select the opration you want by it is number: \n");
    print("0: Add a new employee:");
    print("1: Display employee data:");
    print("2: Updat salary ,permissions, and job description:");
    print("3: List All Employees:");
    print("Q: Exit");
    print("\n");
    print("* Enter your choise:");
    String? userInput = stdin.readLineSync();
    //switch for manger mangment
    switch (userInput) {
      //add new employee
      case "0":
        print("* Enter emplyee name:");
        String? nameInput = stdin.readLineSync();
        print("* Enter emplyee salary that at least 5000:");
        int salaryInput = int.parse(stdin.readLineSync()!);
        print("* Enter emplyee description:");
        String? descriptionInput = stdin.readLineSync();
        print(
            "* Select employee permissions  least one spearated by (,): {Read, Write, Execute or Delete } :");
        String? permissionsInput = stdin.readLineSync();
        Set<String> permissions = {};
        if (permissionsInput!.isNotEmpty) {
          List<String> permissionList =
              permissionsInput.split(',').map((s) => s.trim()).toList();
          Set<String> permissionsType = {'Read', 'Write', 'Execute', 'Delete'};
          for (var element in permissionList) {
            if (permissionsType.contains(element)) {
              permissions.add(element);
            } else {
              print('XXX Invalid permission: $element');
            }
          }
        }
        if (salaryInput >= 5000 && permissions.isNotEmpty) {
          if (nameInput!.isNotEmpty || descriptionInput!.isNotEmpty) {
            addEmployee(
              name: nameInput,
              salary: salaryInput,
              description: descriptionInput,
              permissions: permissions,
            );
          } else {
            addEmployee(
              name: "---",
              salary: salaryInput,
              description: "---",
              permissions: permissions,
            );
          }
        } else {
          if (salaryInput <= 5000) {
            print("XXX Salary must be more than 5000");
          }
          if (permissions.isEmpty) {
            print("XXX At least one permission must be selected");
          }
        }
        break;

      //Display employee data
      case "1":
        print(message);
        String? employeeIdInput = stdin.readLineSync();
        displayEmployee(employeeId: employeeIdInput);
        break;

      //Updat salary ,permissions, and job description
      case "2":
        print(message);
        String? employeeIdInput = stdin.readLineSync();
        dataUpdate(employeeId: employeeIdInput);
        break;

      //List All Employees
      case "3":
        displayAllEmployee(employeesDisplay: employeesList);
        break;

      //Exit
      case "q" || "Q":
        isExit = exitMethod();
        break;

      default:
        print("XXXXX Invalid choice XXXXX");
    }
  } while (!isExit);
}
