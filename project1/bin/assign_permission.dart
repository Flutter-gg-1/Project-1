import 'dart:io';
import 'print_with_color.dart';
import 'add_employee.dart';

assignPermission({required int id}) {
  Map<String, dynamic> specifiicEmployee = {};
  int count = 0;
  // iterate each employee to find the specific employee for modifying his data
  for (var element in employees) {
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
    print("Enter new permission: ");
    String? newPermission = stdin.readLineSync();
    specifiicEmployee["permission"] = newPermission;
    employees[count] = specifiicEmployee;
    printWithColor(
        text: "\nThe employee's permission updated succesfully!",
        color: "Green");
  }
}
