import 'add_employee.dart';
import 'print_with_color.dart';
/*
    This function for displaying Employee's data from manager
 */
displayEmployeeData({required int id}) {
  const featureName = "Employee Data:";
  // map for storing the specific employee
  Map<String, dynamic> specifiicEmployee = {};
  for (var element in employees) {
    if (element["id"] == id) {
      specifiicEmployee = element;
      break;
    }
  }
// display employee's data 
  if (specifiicEmployee.isNotEmpty) {
    printWithColor(text: "\t\t$featureName", color: 'Blue');
    print("Name: ${specifiicEmployee["name"]}");
    print("ID: ${specifiicEmployee["id"]}");
    print("Salary: ${specifiicEmployee["salary"]}");
    print("Permission: ${specifiicEmployee["permission"]}");
    print("Job Description: ${specifiicEmployee["jobDescription"]}");
    print("-------------------------------");
    print('\n');
    printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
  } else {
    print("ID $id not found");
    printWithColor(text: "\nTo go back for main features (Press Enter)", color: "Black");
  }

}
