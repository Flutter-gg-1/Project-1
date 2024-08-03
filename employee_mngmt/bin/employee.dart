import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'auth/auth.dart';
import './file_mngmt/file_manager.dart';
import '../bin/employee_mngmt.dart';

class Employee {
  String? firstName;
  String? lastName;
  late String? empID;
  static const String nationality = 'Saudi';
  String? dateOfBirth;
  String? gender;

  String? phoneNumber;
  String? email;
  String? address;
  String? password;

  String? role;
  String? dept;
  String? jobDescription;
  int? salary;

  static List<Employee> listOfEmployees = [];

  Employee.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    empID = map['empID'] ?? generateEmployeeID();
    nationality;
    role = map['role'];
    dateOfBirth = map['dateOfBirth'];
    gender = map['gender'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    address = map['address'];
    dept = map['department'];
    jobDescription = map['jobDescription'];
    salary = map['salary'];
  }

  static String storeInfo(Employee emp) {
    if (!listOfEmployees.contains(emp)) {
      emp.password = setPassword(emp);
      listOfEmployees.add(emp);
      updateEmployeeList(emp);
      return emp.empID!;
    }
    return emp.empID!;
  }

  static String generateEmployeeID() {
    Random random = Random();

    /*
    Emplooyee ID is 5 digits
    It cannot start with 0
    */

    int firstDigit = random.nextInt(9) + 1; //Start with number other than 0
    String remainingDigits =
        List.generate(4, (generate) => random.nextInt(10)).join();

    return '$firstDigit$remainingDigits';
  }

  static Employee? getEmployee(String empID) {
    for (var employee in listOfEmployees) {
      if (employee.empID == empID) {
        return employee;
      }
    }
    return null;
  }

  static Map<String, dynamic> fillEmployeeInformation(String? empID) {
    Map<String, dynamic> map = {};
    print('Fill in the following\n');

    stdout.write(cyan('First Name: '));
    map['firstName'] = stdin.readLineSync();
    stdout.write(cyan('Last Name: '));
    map['lastName'] = stdin.readLineSync();
    map['empID'] = empID ?? Employee.generateEmployeeID();
    map['nationaliy'] = nationality;
    stdout.write(cyan('Role: '));
    map['role'] = stdin.readLineSync();
    stdout.write(cyan('Date of Birth: '));
    map['dateOfBirth'] = stdin.readLineSync();
    stdout.write(cyan('Gender: '));
    map['gender'] = stdin.readLineSync();
    stdout.write(cyan('Phone Number: '));
    map['phoneNumber'] = stdin.readLineSync();
    stdout.write(cyan('Email: '));
    map['email'] = stdin.readLineSync();
    stdout.write(cyan('Address: '));
    map['address'] = stdin.readLineSync();
    stdout.write(cyan('Department: '));
    map['department'] = stdin.readLineSync();
    stdout.write(cyan('Job Description: '));
    map['jobDescription'] = stdin.readLineSync();
    stdout.write(cyan('Salary: '));
    map['salary'] = int.parse(stdin.readLineSync()!);

    return map;
  }

  static updateEmployee(Employee emp, Map<String, dynamic> updatedInfo) {
    emp.firstName = updatedInfo['firstName'];
    emp.lastName = updatedInfo['lastName'];
    emp.role = updatedInfo['role'];
    emp.dateOfBirth = updatedInfo['dateOfBirth'];
    emp.gender = updatedInfo['gender'];
    emp.phoneNumber = updatedInfo['phoneNumber'];
    emp.email = updatedInfo['email'];
    emp.address = updatedInfo['address'];
    emp.dept = updatedInfo['department'];
    emp.jobDescription = updatedInfo['jobDescription'];
    emp.salary = updatedInfo['salary'];
  }

  static deleteEmployee(Employee emp) {
    stdout.write(
        white('Are you sure you want to delete Employee ${emp.empID}?? y/n: '));
    String answer = stdin.readLineSync()!;
    if (answer.toLowerCase() == 'y') {
      updateEmployeeInJson(emp, emp.empID!, isToDelete: true);
      updateLoginList(emp, isToDelete: true, empty: {});
    } else {
      print(white('Employee Not deleted.'));
    }
  }

  static viewInfo(Employee? emp) {
    if (emp == null) {
      print('\nEmployee Not Found!!\n');
      return;
    }
    print(blue(
        'Name: ${emp.firstName} ${emp.lastName}\nid: ${emp.empID}\nNationality: $nationality\nDate of Birth: ${emp.dateOfBirth}\nGender: ${emp.gender}\nPhoneNumber: ${emp.phoneNumber}\nEmail: ${emp.email}\nAddress: ${emp.address}\nrole: ${emp.role}\nDepartment: ${emp.dept}\nJob Description: ${emp.jobDescription}\nSalary: ${emp.salary}'));
  }

  static setSalary(Employee emp, int amount) {
    int index = -1;
    for (var i = 0; i < listOfFiles[0].length; i++) {
      if (listOfFiles[0][i]['empID'] == emp.empID) {
        listOfFiles[0][i]['salary'] = amount;
        index = i;
        break;
      }
    }
    if (index > 0) {
      updateEmployeeList(emp, updatedInfo: listOfFiles[0][index]);
    }
    emp.salary = amount;
    readFiles(listOfFiles);
  }

  static setJobDescription(Employee emp, String jobDescription) {
    int index = -1;
    for (var i = 0; i < listOfFiles[0].length; i++) {
      if (listOfFiles[0][i]['empID'] == emp.empID) {
        listOfFiles[0][i]['jobDescription'] = jobDescription;
        break;
      }
    }
    if (index > 0) {
      updateEmployeeList(emp, updatedInfo: listOfFiles[0][index]);
    }
    emp.jobDescription = jobDescription;
    readFiles(listOfFiles);
  }

  static void addToPermission(Employee emp) async {
    File file = File('bin/lists/permission.json');
    String records = await file.readAsString();
    List temp = jsonDecode(records);

    Map<String, dynamic> newPermission = {
      'empID': emp.empID,
      'permission': true
    };

    temp.add(newPermission);
    String update = jsonEncode(temp);
    file.writeAsStringSync(update, mode: FileMode.write);
    readFiles(listOfFiles);
  }
}
