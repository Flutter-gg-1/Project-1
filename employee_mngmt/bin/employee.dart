import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
// import 'department.dart';
// import 'employee_mngmt.dart';

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

  static Map<String, dynamic> fillEmployeeInformation() {
    Map<String, dynamic> map = {};
    print('Fill in the following');

    stdout.write('First Name: ');
    map['firstName'] = stdin.readLineSync();
    stdout.write('Last Name: ');
    map['lastName'] = stdin.readLineSync();
    map['empID'] = Employee.generateEmployeeID();
    stdout.write('Role: ');
    map['role'] = stdin.readLineSync();
    stdout.write('Date of Birth: ');
    map['dateOfBirth'] = stdin.readLineSync();
    stdout.write('Gender: ');
    map['gender'] = stdin.readLineSync();
    stdout.write('Phone Number: ');
    map['phone Number'] = stdin.readLineSync();
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

  static viewInfo(Employee? emp) {
    if (emp == null) {
      print('Employee Not Found!!');
      return;
    }
    print('Name: ${emp.firstName} ${emp.lastName}');
    print('id: ${emp.empID}');
    print('Nationality: $nationality');
    print('Date of Birth: ${emp.dateOfBirth}');
    print('Gender: ${emp.gender}');
    print('Phone Number: ${emp.phoneNumber}');
    print('Email: ${emp.email}');
    print('Address: ${emp.address}');
    print('role: ${emp.role}');
    print('Department: ${emp.dept}');
    print('Job Description: ${emp.jobDescription}');
    print('Salary: ${emp.salary}');
  }

  static String setPassword(Employee emp) {
    stdout.write('Enter your new password: ');
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    emp.password = hashedPassword;
    emp.updateLoginList(emp);
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

  static Future<void> updateEmployeeList(Employee emp) async {
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
        temp[i] = newEmployee;
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

  updateLoginList(Employee emp) {
    //Update login.json
    Map<String, dynamic> newLogin = {
      'empID': emp.empID,
      'passwordHash': emp.password
    };

    File loginFile = File('bin/lists/login.json');
    String loginRecords = loginFile.readAsStringSync();
    List temp2 = jsonDecode(loginRecords);

    //update json file
    temp2.add(newLogin);
    String updateLogin = jsonEncode(temp2);
    loginFile.writeAsStringSync(updateLogin, mode: FileMode.write);
  }
}
