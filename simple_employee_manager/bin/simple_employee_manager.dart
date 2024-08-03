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
        print("* Enter emplyee salary:");
        int salaryInput = int.parse(stdin.readLineSync()!);
        print("* Enter emplyee description:");
        String? descriptionInput = stdin.readLineSync();
        print(
            "* Select employee permissions spearated by (,): {Read, Write, Execute or Delete } :");
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
              print('Invalid permission: $element');
            }
          }
        }

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
            salary: 0,
            description: "---",
            permissions: {},
          );
        }
        break;

      case "1":
        print("* Enter employee ID:");
        String? employeeIdInput = stdin.readLineSync();
        displayEmployee(employeeId: employeeIdInput);
        break;

      case "2":
        break;

      case "3":
      displayAllEmployee(employeesDisplay: employeesList);
        break;

      case "q" || "Q":
        isExit = exitMethod();
        break;

      default:
        print("XXXXX Invalid choice XXXXX");
    }
  } while (!isExit);
}
