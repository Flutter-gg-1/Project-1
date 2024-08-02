// Employee class represents an employee properities and actions
class Employee {
  // class attributes
  final int id;
  final String name;
  double salary;
  List permissions;
  String jobDesc;

  // constructor
  Employee(
      {required this.id,
      required this.name,
      required this.salary,
      required this.jobDesc,
      required this.permissions});

  // class behaviours
  // function to display employee info
  void display() {
    print('*' * 30);
    print('Employee ID : $id');
    print('Employee Name : $name');
    print('Employee Salary : $salary');
    print('Employee Permissions : ${permissions.isEmpty ? 'None' : permissions}');
    print('Employee Job Description : $jobDesc');
  }
}
