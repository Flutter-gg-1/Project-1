/*
  Step 1: Create a new file named employee.dart in the bin directory.
  Step 2: Add the following code to the employee.dart file to define the Employee class.
*/
class Employee {
  // Properties
  String name;
  double salary;
  String jobDescription;
  Set<String> permissions;

  // Constructor
  Employee({
    required this.name,
    required this.salary,
    required this.jobDescription,
    required this.permissions,
  });
}
