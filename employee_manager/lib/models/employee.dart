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
  // function to print permissions
  String getPermissions() {
    String permissionsString = '\n';
    for(int i=0; i<permissions.length; i++) {
      permissionsString += 'Permission ${i+1} --> ${permissions[i]}\n';
    }
    return permissionsString;
  }

  // function to make promotion
  void promote() {
    salary+=1000;
    print("Employee $name with ID $id earned a promotion ! 🎉");
  }

  // function to display employee info
  void display() {
    print('*' * 30);
    print('Employee ID : $id');
    print('Employee Name : $name');
    print('Employee Salary : $salary');
    print('Employee Job Description : $jobDesc');
    print('Employee Permissions : ${permissions.isEmpty ? 'None' : getPermissions()}');
  }
}