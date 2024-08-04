import 'dart:io';

void main() {
  while (true) {
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
        break;
      case "2":
        break;
      case "3":
        break;
      case "4":
        break;
      case "5":
        break;
      case "6":
        break;
      case "0":
        print("Goodbye!");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
