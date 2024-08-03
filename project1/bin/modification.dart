import 'dart:io';
import 'add_employee.dart';
import 'print_with_color.dart';
import 'assign_permission.dart';
import 'modify_salary.dart';

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
       modifySalary(id: id);
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
