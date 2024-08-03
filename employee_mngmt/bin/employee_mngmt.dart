import 'dart:io';
import 'dart:convert';
import 'employee.dart';
import 'exit_method.dart';
import '../login/logging_in.dart';
import 'employee.dart';

List<dynamic> listOfFiles = [];

void main(List<String> arguments) async {
  await readFiles(listOfFiles);
  bool isExit = false;

  String userID = await login();

  do {
    if (userID != '0') {
      for (var i = 0; i < listOfFiles[2].length; i++) {
        if (listOfFiles[2][i].containsValue(userID)) {
          print('---Welcome ');
          print('\n1: Add Employee');
          print('2: Choose Employee');
          print('0: Exit');

          stdout.write('\nEnter your choice: ');
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              print('To add a new Employee, complete the following');
              Map<String, dynamic> map = Employee.fillEmployeeInformation();
              String firstName = Employee.storeInfo(Employee.fromMap(map));
              print('Employee $firstName Added Successfully!!');

            case '2':
              stdout.write('Enter Employee ID: ');
              String? empID = stdin.readLineSync();

              print('\n1: View information');
              print('2: Update Salary');
              print('3: Set Permissoins');

              stdout.write('\nEnter your choice: ');
              String? choice = stdin.readLineSync();

              switch (choice) {
                case '1':
                  Employee.viewInfo(Employee.getEmployee(empID!));
                case '2':
                  stdout.write('Enter New Salary: ');
                  int? salary = int.parse(stdin.readLineSync()!);
                  Employee.setSalary(Employee.getEmployee(empID!)!, salary);
                  print('Salary has been updated.');
                case '3':
                  stdout.write(
                      'Are you sure you want to give permission to Employee $empID? y/n: ');
                  String? answer = stdin.readLineSync();
                  if (answer!.toLowerCase() == 'y') {
                    Employee.addToPermission(Employee.getEmployee(empID!)!);
                    print('Employee added to the list of Permissoins.');
                  }
                default:
              }

            case '0' || '':
              isExit = exitMethod();
            default:
          }
          break;
        } else {
          print('1: View my Information');
          print('2: Set password');
          print('3: View Department ID');
          print('0: Exit');

          stdout.write('\nEnter your choice: ');
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              Employee.viewInfo(Employee.getEmployee(userID));
            case '2':
              Employee.setPassword(Employee.getEmployee(userID)!);
            case '3':
              print(
                  'Department: ${Employee.getEmployee(userID)!.dept}');
            case '0' || '':
              isExit = exitMethod();
            default:
          }
        }
      }
    } else {
      isExit = exitMethod();
    }
  } while (!isExit);
}

readFiles(List<dynamic> files) {
  File empFile = File('bin/lists/employee.json');
  String employees = empFile.readAsStringSync();
  List<dynamic> temp = jsonDecode(employees);

  for (var i = 0; i < temp.length; i++) {
    Employee.listOfEmployees.add(Employee.fromMap(temp[i]));
  }

  files.add(temp);
  temp.clear;

  empFile = File('bin/lists/login.json');
  String loginInfo = empFile.readAsStringSync();
  temp = jsonDecode(loginInfo);

  files.add(temp);
  temp.clear;

  empFile = File('bin/lists/permission.json');
  String permissions = empFile.readAsStringSync();
  temp = jsonDecode(permissions);

  files.add(temp);
  temp.clear;
}
