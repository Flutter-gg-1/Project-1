import 'dart:io';
import 'add_employee.dart';
import 'print_with_color.dart';
import 'assign_permission.dart';

/*
    This function for modifying employee's data
*/
modifyEmployeeData({required int id}) {
  // map for storing spceific employee's data
  Map<String, dynamic> specifiicEmployee = {};
  int count = 0;
  // iterate each employee to find the specific employee for modifying his data
  for (var element in employees) {
    // modifying data only for employees who have a permission of write or execute
    bool permission = (element["permission"] == 'Write' ||
        element["permission"] == "write" ||
        element["permission"] == "Execute" ||
        element["permission"] == "execute");
    if (element["id"] == id && permission) {
      specifiicEmployee = element;
      break;
    }
    count++;
  }
  if (specifiicEmployee.isNotEmpty) {
    // selecting what to to change
    printWithColor(text: "\t    what would you like to modify?\n", color: 'Cyan');
    print("[1] Slary");
    print("[2] Permission");
    print("[3] Job Description");
    printWithColor(
        text: "\n_____________Please choose a number________________",
        color: "Magenta");
    int input = int.parse(stdin.readLineSync()!);
    switch (input) {
      case 1:
        /*
      --------------------------modifying salary for overtime-------------------------------- 
      the application give an overtime pay if overtime workin houre less than or equal 4 hours
      if overtime working hour greater than 4 hours they will get the overtime pay for 4 hours
      */
        print("Enter overtime hours per day: ");
        var overtime = int.parse(stdin.readLineSync()!);
        print("How many days you worked for overtime: ");
        var day = int.parse(stdin.readLineSync()!);
        num newSalary = 0;
        if (overtime <= 4) {
          newSalary = (overtime * 50 * day) + specifiicEmployee["salary"];
          specifiicEmployee["salary"] = newSalary;
          employees[count] = specifiicEmployee;
          printWithColor(
              text:
                  "The salary of employee ${specifiicEmployee["name"]} is: $newSalary",
              color: "Green");
        } else {
          newSalary = (4 * 50 * day) + specifiicEmployee["salary"];
          printWithColor(
              text:
                  "The salary of employee ${specifiicEmployee["name"]} is: $newSalary",
              color: "Green");
        }
      case 2:
        assignPermission(id: id);
      case 3:
        print("Enter new job description: ");
        String? newJobDescription = stdin.readLineSync();
        specifiicEmployee["jobDescription"] = newJobDescription;
        employees[count] = specifiicEmployee;
        printWithColor(
            text: "\nThe employee's job description updated succesfully!",
            color: "Green");
    }
  } else {
    printWithColor(
        text: "You dont have a permission for modification or ID $id not found",
        color: "Red");
  }
  printWithColor(
      text: "\nTo go back for main features (Press Enter)", color: "Black");
      stdin.readLineSync();
}
