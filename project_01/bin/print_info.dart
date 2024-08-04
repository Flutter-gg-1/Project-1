import 'employee.dart';

List<Employee> employees = [];

//This function will print the employee details
void printEmployeeDetails(Employee employee) {
  print("Name: ${employee.name}");
  print("Salary: \$${employee.salary.toStringAsFixed(2)}");
  print("Job Description: ${employee.jobDescription}");
  print("Permissions: ${employee.permissions.join(', ')}");
}
