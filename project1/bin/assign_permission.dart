import 'dart:io';
import 'print_with_color.dart';
import 'add_employee.dart';

assignPermission({required int id}) {
  Map<String, dynamic> specifiicEmployee = {};
  int count = 0;
  // iterate each employee to find the specific employee for modifying his data
  for (var element in employees) {
    bool permission = (element["permission"] == 'Admin' ||
        element["permission"] == "admin" ||
        element["permission"] == "Manager" ||
        element["permission"] == "manager");
    if (element["id"] == id && permission) {
      specifiicEmployee = element;
      break;
    }
    count++;
  }
  if (specifiicEmployee.isNotEmpty) {
    //double salary = 0.0;
    print("Enter new permission: ");
    String? newPermission = stdin.readLineSync();
    specifiicEmployee["permission"] = newPermission;
    employees[count] = specifiicEmployee;
    if (newPermission == 'Admin' || newPermission == "admin") {
      specifiicEmployee["salary"] = 12000;
    } else if (newPermission == "Manager" || newPermission == "manager") {
      specifiicEmployee["salary"] = 10000;
    } else {
      specifiicEmployee["salary"] = 8000;
    }
    printWithColor(
        text: "\nThe employee's permission updated succesfully!",
        color: "Green");
  }
}
