import 'dart:math'; // library used to generate random id

// Employee class represents an employee properities and actions

class Employee {
  // class attributes
  final int id = Random().nextInt(9999999);
  final String name;
  double salary;
  List permissions;
  String jobDesc;

  // constructor
  Employee(
      {required this.name,
      required this.salary,
      required this.jobDesc,
      required this.permissions});

  // class behaviours
  // function to return info as key-value pairs
  Map getInfo() {
    return {
      'id': id,
      'name': name,
      'salary': salary,
      'permissions': permissions,
      'job description': jobDesc
    };
  }

  // function to display employee info
  void display() {
    Map info = getInfo();
    print('*' * 30);
    print('Employee ID : ${info['id']}');
    print('Employee Name : ${info['name']}');
    print('Employee Salary : ${info['salary']}');
    print('Employee Permissions : ${info['permissions'].isEmpty ? 'None' : info['permissions']}');
    print('Employee Job Description : ${info['job description']}');
  }
}
