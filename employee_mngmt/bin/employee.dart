import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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
      return emp.firstName!;
    }
    return emp.firstName!;
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

    stdout.write('First Name: ');
    map['firstName'] = stdin.readLineSync();
    stdout.write('Last Name: ');
    map['lastName'] = stdin.readLineSync();
    map['empID'] = empID ?? Employee.generateEmployeeID();
    map['nationaliy'] = nationality;
    stdout.write('Role: ');
    map['role'] = stdin.readLineSync();
    stdout.write('Date of Birth: ');
    map['dateOfBirth'] = stdin.readLineSync();
    stdout.write('Gender: ');
    map['gender'] = stdin.readLineSync();
    stdout.write('Phone Number: ');
    map['phoneNumber'] = stdin.readLineSync();
    stdout.write('Email: ');
    map['email'] = stdin.readLineSync();
    stdout.write('Address: ');
    map['address'] = stdin.readLineSync();
    stdout.write('Department: ');
    map['department'] = stdin.readLineSync();
    stdout.write('Job Description: ');
    map['jobDescription'] = stdin.readLineSync();
    stdout.write('Salary: ');
    map['salary'] = int.parse(stdin.readLineSync()!);

    return map;
  }

  static void updateEmployeeInJson(Employee emp, String empID) {
    File file = File('bin/lists/employee.json');
    String records = file.readAsStringSync();
    List<dynamic> employees = jsonDecode(records);

    for (var i = 0; i < employees.length; i++) {
      if (employees[i]['empID'] == empID) {
        Map<String, dynamic> updatedInfo = fillEmployeeInformation(empID);
        updateEmployee(emp, updatedInfo);
        updateEmployeeList(getEmployee(empID)!, updatedInfo: updatedInfo);
        print('\nEmployee Information updated successfully!!');
        break;
      }
    }
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

  static viewInfo(Employee? emp) {
    if (emp == null) {
      print('\nEmployee Not Found!!\n');
      return;
    }
    print('Name: ${emp.firstName} ${emp.lastName}');
    print('id: ${emp.empID}');
    print('Nationality: $nationality');
    print('Date of Birth: ${emp.dateOfBirth}');
    print('Gender: ${emp.gender}');
    print('PhoneNumber: ${emp.phoneNumber}');
    print('Email: ${emp.email}');
    print('Address: ${emp.address}');
    print('role: ${emp.role}');
    print('Department: ${emp.dept}');
    print('Job Description: ${emp.jobDescription}');
    print('Salary: ${emp.salary}');
  }

  static String setPassword(Employee emp) {
    stdout.write('\nEnter your new password: ');
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    emp.password = hashedPassword;
    emp.updateLoginList(emp, hashedPassword: hashedPassword);
    return hashedPassword;
  }

  static int setSalary(Employee emp, int amount) {
    return emp.salary = amount;
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
  }

  static Future<void> updateEmployeeList(Employee emp,
      {Map<String, dynamic>? updatedInfo}) async {
    //Update employee.json

    Map<String, dynamic> newEmployee = {
      'firstName': emp.firstName,
      'lastName': emp.lastName,
      'empID': emp.empID,
      'nationality': nationality,
      'role': emp.role,
      'dateOfBirth': emp.dateOfBirth,
      'gender': emp.gender,
      'phoneNumber': emp.phoneNumber,
      'email': emp.email,
      'address': emp.address,
      'department': emp.dept,
      'jobDescription': emp.jobDescription,
      'salary': emp.salary,
    };

    File file = File('bin/lists/employee.json');
    String records = file.readAsStringSync();
    List temp = jsonDecode(records);

    // update existing employee
    bool found = false;
    for (int i = 0; i < temp.length; i++) {
      if (temp[i]['empID'] == emp.empID) {
        temp[i] = updatedInfo;
        found = true;
        break;
      }
    }

    //update json file
    if (!found) {
      temp.add(newEmployee);
    }
    String update = jsonEncode(temp);
    file.writeAsStringSync(update, mode: FileMode.write);
  }

  updateLoginList(Employee emp, {String? hashedPassword}) {
    //Update login.json
    Map<String, dynamic> newLogin = {
      'empID': emp.empID,
      'passwordHash': emp.password
    };

    File loginFile = File('bin/lists/login.json');
    String loginRecords = loginFile.readAsStringSync();
    List temp2 = jsonDecode(loginRecords);

    // update existing login
    bool found = false;
    for (int i = 0; i < temp2.length; i++) {
      if (temp2[i]['empID'] == emp.empID) {
        temp2[i]['passwordHash'] = hashedPassword;
        found = true;
        break;
      }
    }

    //update json file
    if (!found) {
      temp2.add(newLogin);
    }
    String updateLogin = jsonEncode(temp2);
    loginFile.writeAsStringSync(updateLogin, mode: FileMode.write);
  }
}
