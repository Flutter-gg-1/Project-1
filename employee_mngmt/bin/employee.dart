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
  bool permission = false;
  int? salary;

  static List<Employee> listOfEmployees = [];

  Employee(
      {required this.firstName,
      required this.lastName,
      required this.role,
      this.dateOfBirth,
      this.gender,
      this.phoneNumber,
      this.email,
      this.address,
      this.dept,
      this.jobDescription,
      this.salary}) {
    empID = generateEmployeeID();
    password = setPassword();
    listOfEmployees.add(empID as Employee);
  }

  viewInfo() {
    print('Name: $firstName $lastName');
    print('id: $empID');
    print('Nationality: $nationality');
    print('Date of Birth: $dateOfBirth');
    print('Gender: $gender');
    print('Phone Number: $phoneNumber');
    print('Email: $email');
    print('Address: $address');
    print('role: $role');
    print('Department: $dept');
    print('Job Description: $jobDescription');
    print('Salary: $salary');
    print('Permission: $permission');
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

  String setPassword() {
    stdout.write('Enter your new password');
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    this.password = hashedPassword;
    return hashedPassword;
  }

  int setSalary(int amount){
    return salary = amount;
  }

  bool setPermission(){
    return permission = true;
  }
}
