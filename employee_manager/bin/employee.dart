import 'dart:io';
import 'dart:math';

import 'global_var.dart';

class Employee {
  int? id = Random().nextInt(9999);
  String? name;
  int? salary;
  String? permissions;
  String? jopDescripiton;

  Employee();

//function to add employee
  addEmployee() {
    print("\nAdd employee name:");
    name = stdin.readLineSync();
    print("Add employee salary:");
    salary = int.parse(stdin.readLineSync()!);
    print("Add employee permissions:");
    permissions = stdin.readLineSync();
    print("Add employee jop descripiton:");
    jopDescripiton = stdin.readLineSync();

    Map<String, dynamic> employeeinfo = {
      "id": id,
      "name": name,
      "salary": salary,
      "permissions": permissions,
      "jopDescripiton": jopDescripiton
    };

    employees.add(employeeinfo);

    print("\n Employee added successfully!");

    stdin.readLineSync();
  }
}
