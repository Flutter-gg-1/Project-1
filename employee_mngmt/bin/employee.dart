import 'dart:math';

class Employee {
  String? firstName;
  String? lastName;
  String? empID;
  String? nationality;
  String? dateOfBirth;
  String? gender;

  String? phoneNumber;
  String? email;
  String? address;

  String? role;
  String? jobDescription;
  String? dept;
  int? salary;

  List<Employee> listOfEmployees = [];

  Employee(
      {required this.firstName,
      required this.lastName,
      required this.role,
      this.nationality,
      this.dateOfBirth,
      this.gender,
      this.phoneNumber,
      this.email,
      this.address,
      this.jobDescription,
      this.dept,
      this.salary}) {
    empID = generateEmployeeID();
    listOfEmployees.add(this);
  }

  String generateEmployeeID() {
    Random random = Random();

    int firstDigit = random.nextInt(9) + 1; //Start with number other than 0
    String remainingDigits =
        List.generate(4, (generate) => random.nextInt(10)).join();

    return '$firstDigit$remainingDigits';
  }
}
