import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'department.dart';

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
  Department? dept;
  String? jobDescription;
  static List<Employee> permissionList = [];
  int? salary;

  static List<Employee> listOfEmployees = [];

  Employee({
    required this.firstName,
    required this.lastName,
    required this.role,
  }) {
    empID = generateEmployeeID();
    password = setPassword(this);
    fillEmployeeInformation(this);
    listOfEmployees.add(this);
    print('Employee $empID Added Successfully!!');
  }

  static Employee? getEmployee(String empID) {
    int employeeIndex = -1;
    for (int i = 0; i < listOfEmployees.length; i++) {
      if (listOfEmployees[i].empID == empID) {
        employeeIndex = i;
        break;
      }
    }
    if (employeeIndex > 0) {
      return listOfEmployees[employeeIndex];
    } else {
      return null;
    }
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
    print('Department: ${emp.dept!.deptName}');
    print('Job Description: ${emp.jobDescription}');
    print('Salary: ${emp.salary}');
    print('Permission to Modify: ${permissionList.contains(emp)}');
  }

  String generateEmployeeID() {
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

  fillEmployeeInformation(Employee emp) {
    print('Fill in the following');
    stdout.write('Date of Birth: ');
    emp.dateOfBirth = stdin.readLineSync();
    stdout.write('Gender: ');
    emp.gender = stdin.readLineSync();
    stdout.write('Phone Number: ');
    emp.phoneNumber = stdin.readLineSync();
    stdout.write('Email: ');
    emp.email = stdin.readLineSync();
    stdout.write('Address: ');
    emp.address = stdin.readLineSync();
    stdout.write('Department: ');
    Department department = Department(deptName: stdin.readLineSync());
    emp.dept = department;
    stdout.write('Job Description: ');
    emp.jobDescription = stdin.readLineSync();
    stdout.write('Salary: ');
    emp.salary = int.parse(stdin.readLineSync()!);
  }

  static String setPassword(Employee emp) {
    stdout.write('Enter your new password: ');
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    emp.password = hashedPassword;
    return hashedPassword;
  }

  static int setSalary(Employee emp, int amount) {
    return emp.salary = amount;
  }

  static void addToPermission(Employee emp) {
    Employee.permissionList.add(emp);
  }
}
