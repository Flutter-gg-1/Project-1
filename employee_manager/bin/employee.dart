import 'dart:io';
import 'dart:math';

List<Map<String, dynamic>> employees = [];

class Employee {
  int? id = Random().nextInt(9999);
  String? name;
  int? salary;
  String? permissions;
  String? jopDescripiton;

  Employee();

//function to add employee
  addEmployee() {
    print("Add employee name:");
    name = stdin.readLineSync();
    print("Add employee salary:");
    salary = int.parse(stdin.readLineSync()!);
    print("Add employee permissions:");
    permissions = stdin.readLineSync();
    print("Add employee jopDescripiton:");
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

  deleteEmployee(int id) {
    for (var element in employees) {
      if (element["id"] == id) {
        employees.remove(element);
        print("Employee deleted successfully");
      } else {
        print("\n Employee with $id id not found!");
      }
    }
  }
}
