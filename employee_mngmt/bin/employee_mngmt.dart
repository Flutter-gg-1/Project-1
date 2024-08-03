import 'dart:io';
import 'employee.dart';
import 'package:employee_mngmt/exit_method.dart';
import 'auth/auth.dart';
import './file_mngmt/file_manager.dart';

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
              print('To add a new Employee, complete the following\n');
              Map<String, dynamic> map = Employee.fillEmployeeInformation(null);
              String firstName = Employee.storeInfo(Employee.fromMap(map));
              print('Employee $firstName Added Successfully!!');
              stdin.readLineSync();
            case '2':
              stdout.write('Enter Employee ID: ');
              String? empID = stdin.readLineSync();

              print('\n1: View information');
              print('2: Update Employee Information');
              print('3: Update Salary');
              print('4: Update Job Description');
              print('5: Set Permissoins');

              stdout.write('\nEnter your choice: ');
              String? choice = stdin.readLineSync();

              switch (choice) {
                case '1':
                  Employee.viewInfo(Employee.getEmployee(empID!));
                  stdin.readLineSync();
                case '2':
                  updateEmployeeInJson(Employee.getEmployee(userID)!, userID);
                  stdin.readLineSync();
                case '3':
                  stdout.write('Enter New Salary: ');
                  int? salary = int.parse(stdin.readLineSync()!);
                  Employee.setSalary(Employee.getEmployee(empID!)!, salary);
                  print('Salary has been updated.');
                  stdin.readLineSync();
                case '4':
                  stdout.write('Enter New job description: ');
                  String? jobDescription = stdin.readLineSync();
                  Employee.setJobDescription(
                      Employee.getEmployee(empID!)!, jobDescription!);
                  print('Job Description has been updated.');
                  stdin.readLineSync();
                case '5':
                  stdout.write(
                      'Are you sure you want to give permission to Employee $empID? y/n: ');
                  String? answer = stdin.readLineSync();
                  if (answer!.toLowerCase() == 'y') {
                    Employee.addToPermission(Employee.getEmployee(empID!)!);
                    print('Employee added to the list of Permissoins.');
                  } else {
                    print('Employee NOT added to the list of Permissoins.');
                  }
                  stdin.readLineSync();
                default:
              }

            case '0' || '':
              isExit = exitMethod();
            default:
          }
          break;
        } else {
          print('\n1: View my Information');
          print('2: Set password');
          print('3: Update Information');
          print('0: Exit');

          stdout.write('\nEnter your choice: ');
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              Employee.viewInfo(Employee.getEmployee(userID));
              stdin.readLineSync();
            case '2':
              setPassword(Employee.getEmployee(userID)!);
              stdin.readLineSync();
            case '3':
              updateEmployeeInJson(Employee.getEmployee(userID)!, userID);
              stdin.readLineSync();
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
