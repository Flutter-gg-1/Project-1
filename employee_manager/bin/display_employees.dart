import 'employee.dart';

//function to dispaly employees
displayEmployee() {
  for (var element in employees) {
    print("-------------------------------");
    print("ID: ${element["id"]}");
    print("Name: ${element["name"]}");
    print("Salary: ${element["salary"]}");
    print("Permissions: ${element["permissions"]}");
    print("Jop descripiton: ${element["jopDescripiton"]}");
    print("-------------------------------");
    print('\n');
  }
}
