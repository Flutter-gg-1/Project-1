import 'dart:io'; // function to interact with user
import 'package:employee_manager/models/employee.dart'; // employee class

// function to add a new employee
Employee addEmployee({required int id}) {
  // ask manager to enter employee name
  stdout.write("Enter employee name : ");
  String? name = stdin.readLineSync();
  // name validation
  while(name!.isEmpty || !name.contains(RegExp('^[a-zA-Z ]+\$'))) {
    print("ERROR !! : Invalid Name\n");
    stdout.write("Enter employee name : ");
    name = stdin.readLineSync();
  }

  // ask manager to enter employee salary
  stdout.write("Enter employee salary in SR : ");
  String? salary = stdin.readLineSync();
  // salary validation
  while(salary!.isEmpty || double.tryParse(salary) == null) {
    print("ERROR !! : Invalid Salary\n");
    stdout.write("Enter employee salary in SR : ");
    salary = stdin.readLineSync();
  }
  
  // ask manager to enter employee job desription
  stdout.write("Enter employee job description : ");
  String? jobDesc = stdin.readLineSync();
  // job description validation
  while(jobDesc!.isEmpty) {
    print("ERROR !! : Invalid job description\n");
    stdout.write("Enter employee job description : ");
    jobDesc = stdin.readLineSync();
  }
  
  // ask manager if employee has current permissions
  List permissions = [];
  stdout.write("How many permissions does $name have (0-3) ? : ");
  String? numOfPermissions = stdin.readLineSync();
  // number validation
  while(numOfPermissions!.isEmpty || !['0','1','2','3'].contains(numOfPermissions)) {
    print("ERROR !! : Invalid number\n");
    stdout.write("How many permissions does $name have (0-3) ? : ");
    numOfPermissions = stdin.readLineSync();
  }
  // add permissions if exist
  for(int i=0; i<int.parse(numOfPermissions); i++) {
    stdout.write("Enter permission ${i+1} : ");
    permissions.add(stdin.readLineSync());
  }

  // finally, return an instance of class employee with above inputs
  return Employee(id:id, name: name, salary: double.parse(salary), jobDesc: jobDesc, permissions: permissions);
}
