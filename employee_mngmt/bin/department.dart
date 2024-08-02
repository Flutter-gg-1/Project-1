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

  String generateDeptID(String? deptName) {
    Random random = Random();

    String firstChar =
        deptName!.substring(0, 1); //Start with first letter of Department name
    String remainingDigits =
        List.generate(4, (generate) => random.nextInt(10)).join();

    return '$firstChar$remainingDigits';
  }
}
