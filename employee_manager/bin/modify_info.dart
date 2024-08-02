import 'dart:io';
import 'get_input_salary.dart'; // function to get salary input from user
import 'get_input_job_desc.dart'; // function to get job description input from user
import 'get_input_permissions.dart'; // function to get permissions input from user
import 'package:employee_manager/models/employee.dart'; // employee class

void modifyInfo({required int id, required Map<int, Employee> employees}) {
  Employee employee = employees[id]!;
  while_modify:
  while (true) {
    print('What modification do you want to perform on employee $id ?');
    print('1- salary');
    print('2- job description');
    print('3- add permission');
    print('4- delete permission');
    print('0- back to main menu');
    print("*"*30);
    stdout.write("Choose an option : ");
    String? modifyChoice = stdin.readLineSync();

    switch (modifyChoice) {
      // back to main menu
      case '0':
        break while_modify;

      // modify salary
      case '1':
        employee.salary = getInputSalary();
        print("Salary is updated successfully ✅");

      // modify job description
      case '2':
        employee.jobDesc = getInputJobDesc();
        print("Job description is updated successfully ✅");

      // add permission if possible
      case '3':
        if (employee.permissions.isEmpty) {
          employee.permissions = getInputPermissions(name: employee.name);
          print("Job description is updated successfully ✅");
        }
        else if (employee.permissions.length == 3) {
          print("ERROR !! : Employee $id has maximum amount of permissions ❌");
        }
        else {
          stdout.write("Enter a permission : ");
          employee.permissions.add(stdin.readLineSync());
          print("Permission added successfully ✅");
        }

      // remove permission if possible
      case '4':
        if (employee.permissions.isNotEmpty) {
          print('current permissions : ');
          for(int i=0; i<employee.permissions.length; i++) {
            print('${i+1}-${employee.permissions[i]}');
          }
          stdout.write("Enter a permission number to remove : ");
          String? index = stdin.readLineSync();

          while(index!.isEmpty || !['1','2','3'].contains(index) || int.parse(index)>employee.permissions.length) {
            print("ERROR !! : Invalid input ❌\n");
            stdout.write("Enter a permission number to remove : ");
            index = stdin.readLineSync();
          }
          employee.permissions.removeAt(int.parse(index)-1);
          print("Permission removed successfully ✅");
        }
        else {
          print("ERROR !! : Employee $id has no permissions ❌");
        }
    }
  }
}