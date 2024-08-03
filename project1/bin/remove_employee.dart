import 'add_employee.dart';
import 'print_with_color.dart';
/*
    This function for deleting an employee and his data
*/
removeEmployee({required int id}){
  // map for storing spceific employee's data
  Map<String, dynamic> specifiicEmployee = {};
  int count = 0;
  // iterate each employee to find the specific employee
  for (var element in employees) {
    if (element["id"] == id) {
      specifiicEmployee = element;
      break;
    }
    count++;
  }
  // deleting an employee
  if (specifiicEmployee.isNotEmpty) {
    employees.removeAt(count);
    printWithColor(text: "Employee removed successfully", color: "Green");
    printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
    }
  else {
    print("ID $id not found");
    printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
  }
}