import 'dart:math';
import 'employee.dart';

class Department {
  String? deptName;
  String? deptID;
  int? numberOfEmployees;
  List<Employee> listOfEmployees = [];
  static List<Department> listOfDept = [];

  Department({required this.deptName}) {
    deptID = generateDeptID(deptName);
    listOfDept.add(this);
  }

  static Department? getDepartment(String deptName) {
    int departmentIndex = -1;
    for (int i = 0; i < listOfDept.length; i++) {
      if (listOfDept[i].deptName == deptName) {
        departmentIndex = i;
        break;
      }
    }
    if (departmentIndex > 0) {
      return listOfDept[departmentIndex];
    } else {
      return null;
    }
  }

  String generateDeptID(String? deptName) {
    Random random = Random();

    String firstChar =
        deptName!.substring(0, 1); //Start with first letter of Department name
    String remainingDigits =
        List.generate(4, (generate) => random.nextInt(10)).join();

    return '$firstChar$remainingDigits';
  }
}
