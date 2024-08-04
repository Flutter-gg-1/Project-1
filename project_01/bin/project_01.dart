import 'dart:io';
import 'employee_manager.dart';

void main() {
  while (true) {
    // Display menu
    print("\nEmployee Manager");
    print("1. Add New Employee");
    print("2. Assign Permissions");
    print("3. Display Employee Data");
    print("4. Modify Salary");
    print("5. Modify Job Description");
    print("6. List All Employees");
    print("0. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addEmployee();
        break;
      case "2":
        assignPermissions();
        break;
      case "3":
        displayEmployeeData();
        break;
      case "4":
        modifySalary();
        break;
      case "5":
        modifyJobDescription();
        break;
      case "6":
        listAllEmployees();
        break;
      case "0":
        print("Exiting...");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
