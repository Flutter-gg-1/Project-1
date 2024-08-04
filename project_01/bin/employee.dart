/* 
  This file contains the Employee class.
  The Employee class is used to create Employee objects.
  Each Employee object has a name, salary, job description, and permissions.
*/
// Employee class
class Employee {
  String name;
  double salary;
  String jobDescription;
  Set<String> permissions;

  Employee({
    required this.name,
    required this.salary,
    required this.jobDescription,
    required this.permissions,
  });
}
