import 'dart:io';
import 'employee.dart';
import 'package:employee_mngmt/exit_method.dart';
import 'auth/auth.dart';
import './file_mngmt/file_manager.dart';
import 'package:ansicolor/ansicolor.dart';

AnsiPen white = AnsiPen()..white(bold: true, bg: true);
AnsiPen cyan = AnsiPen()..cyan(bold: true);
AnsiPen green = AnsiPen()..green(bold: true);
AnsiPen yellow = AnsiPen()..yellow(bold: true);
AnsiPen blue = AnsiPen()..blue(bold: true);
AnsiPen red = AnsiPen()..red(bold: true);
List<dynamic> listOfFiles = [];

void main(List<String> arguments) async {
  await readFiles(listOfFiles);
  bool isExit = false;

  String userID = await login();

  do {
    if (userID != '0') {
      for (var i = 0; i < listOfFiles[2].length; i++) {
        if (listOfFiles[2][i].containsValue(userID)) {
          print(green('---Welcome ${Employee.getEmployee(userID)!.firstName}---'));
          print(yellow('\n1: Add Employee'));
          print(yellow('2: Choose Employee'));
          print(yellow('0: Exit'));

          stdout.write(cyan('\nEnter your choice: '));
          String? choice = stdin.readLineSync();

          switch (choice) {
            case '1':
              print(white('To add a new Employee, complete the following\n'));
              Map<String, dynamic> map = Employee.fillEmployeeInformation(null);
              String empID = Employee.storeInfo(Employee.fromMap(map));
              print(green('Employee $empID Added Successfully!!'));
              stdin.readLineSync();
            case '2':
              stdout.write(cyan('Enter Employee ID: '));
              String? empID = stdin.readLineSync();

              print(yellow('\n1: View information'));
              print(yellow('2: Update Employee Information'));
              print(yellow('3: Update Salary'));
              print(yellow('4: Update Job Description'));
              print(yellow('5: Set Permissoins'));
              print(yellow('6: Delete Employee'));

              stdout.write(cyan('\nEnter your choice: '));
              String? choice = stdin.readLineSync();

              switch (choice) {
                case '1':
                  Employee.viewInfo(Employee.getEmployee(empID!));
                  stdin.readLineSync();
                case '2':
                  updateEmployeeInJson(Employee.getEmployee(userID)!, userID);
                  stdin.readLineSync();
                case '3':
                  stdout.write(cyan('Enter New Salary: '));
                  int? salary = int.parse(stdin.readLineSync()!);
                  Employee.setSalary(Employee.getEmployee(empID!)!, salary);
                  print(green('Salary has been updated.'));
                  stdin.readLineSync();
                case '4':
                  stdout.write(cyan('Enter New job description: '));
                  String? jobDescription = stdin.readLineSync();
                  Employee.setJobDescription(
                      Employee.getEmployee(empID!)!, jobDescription!);
                  print(green('Job Description has been updated.'));
                  stdin.readLineSync();
                case '5':
                  stdout.write(white(
                      'Are you sure you want to give permission to Employee $empID? y/n: '));
                  String? answer = stdin.readLineSync();
                  if (answer!.toLowerCase() == 'y') {
                    Employee.addToPermission(Employee.getEmployee(empID!)!);
                    print(green('Employee added to the list of Permissoins.'));
                  } else {
                    print(white(
                        'Employee NOT added to the list of Permissoins.'));
                  }
                  stdin.readLineSync();
                case '6':
                  Employee.deleteEmployee(Employee.getEmployee(empID!)!);
                default:
              }

            case '0' || '':
              isExit = exitMethod();
            default:
          }
          break;
        } else {
          print(yellow('\n1: View my Information'));
          print(yellow('2: Set password'));
          print(yellow('3: Update Information'));
          print(yellow('0: Exit'));

          stdout.write(cyan('\nEnter your choice: '));
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
