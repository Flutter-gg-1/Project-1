import 'dart:io';
import 'dart:math';
import 'global_var.dart';

class Employee {
// Employee attrbute
  final id = Random().nextInt(9999);
  String? name;
  int? salary;
  String? permissions;
  String? jopDescripiton;

//Eempty constrctior
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

//check that name cannot be empty
    if (name == "") {
      print("\n Name must not be empty!");
    }

//check that salary cannot be less than 3000
    else if (salary! < 3000) {
      print("\n Salary must not be empty or less than 4000!");
    }
//check that permissions cannot be empty
    else if (permissions == "") {
      print("\n permissions must not be empty!");
    }

//add new employee
    else {
      Map<String, dynamic> employeeinfo = {
        "id": id,
        "name": name,
        "salary": salary,
        "permissions": permissions,
        "jopDescripiton": jopDescripiton
      };
      employees.add(employeeinfo);
      print("\n Employee added successfully!");
    }

    stdin.readLineSync();
  }
}
