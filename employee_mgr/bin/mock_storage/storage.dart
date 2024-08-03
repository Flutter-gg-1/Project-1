import 'dart:io';

import '../model/employee/edit_employee.dart';
import '../model/employee/employee.dart';
import '../model/enums/employee_role.dart';
import '../model/enums/employee_status.dart';
import '../utils/colorful_print.dart';

class Storage {
  static var shared = Storage();

  Employee? currentUser;

  List<Employee> allEmployees;
  List<Employee> get employees =>
      allEmployees.where((emp) => emp.state == EmployeeStatus.active).toList();
  List<Employee> get inActiveEmployees => allEmployees
      .where((emp) => emp.state == EmployeeStatus.inActive)
      .toList();

  Storage()
      : allEmployees = [
          Employee(
              name: 'John Doe',
              phoneNum: '1235557799',
              age: 26,
              jobDescription: 'Technician',
              salary: 7320.64),
          Employee(
              name: 'Charls Legend',
              phoneNum: '1234446688',
              age: 45,
              jobDescription: 'Big Boss',
              salary: 45810.64,
              role: EmployeeRole.manager),
          Employee(
              name: 'Jack Sparrow',
              phoneNum: '1234446688',
              age: 23,
              jobDescription: 'Sales Executive',
              salary: 14564.12,
              role: EmployeeRole.employee,
              state: EmployeeStatus.inActive),
        ];

  // Sign in is simply by entering the employee ID into the console
  // Then assigning the employee to the currentUser var
  void signIn() {
    do {
      fetchEmployees();
      print('Who are you? Enter your ID to login');
      var userInput = stdin.readLineSync();
      var temp = allEmployees.firstWhere((e) => e.id.toString() == userInput!,
          orElse: () => Employee(
              name: '', phoneNum: '', age: -1, jobDescription: '', salary: -1));

      // Check if user exists
      currentUser = temp.name.isEmpty ? null : temp;
      // Show console msg
      currentUser == null
          ? ColorfulPrint.red(
              'ERROR: Could not find an employee with id $userInput')
          : ColorfulPrint.green('Signed in as ${currentUser?.name}');
    } while (currentUser == null);
  }

  // Reset the current user
  void signOut() => currentUser = null;

  // Function Logic is in edit_employee.dart
  void editEmployee({required Employee user}) => user.editDetails();

  // Print the list of employees with relevant data
  void fetchEmployees({bool isShort = true, showAll = false}) {
    var arr = (showAll || (currentUser?.hasAccess() ?? false))
        ? allEmployees
        : employees;
    for (var employee in arr) {
      currentUser == null
          ? employee.showEmployeeDetails(short: isShort)
          : employee.showEmployeeDetails(
              fullAccess: currentUser!.hasAccess() || employee == currentUser,
              short: isShort);
    }
  }

  // Manager Functions
  /// Logic implemented here because an employee object is required to use validation functions
  void addNewEmployee() {
    var shouldExit = false;
    ColorfulPrint.magenta('Creating a New Employee');
    do {
      print('''

  Enter the details in the following format: 
  \x1B[33mName\x1B[0m -  \x1B[33mPhone\x1B[0m - \x1B[33mAge\x1B[0m - \x1B[33mJob Desc.\x1B[0m - \x1B[33mSalary\x1B[0m - \x1B[33mRole\x1B[0m(m = mgr, e = emp)

  e.g:
  \x1B[33mJohn Doe - 0501112222 - 45  - Accountant - 800 - e\x1B[0m

  ----------------
  \x1B[35mb | go back Home\x1B[0m
  ----------------
          
       ''');

      var userInput = stdin.readLineSync();

      if (userInput == 'b') {
        shouldExit = true;
      } else {
        var arr = userInput!.split('-');
        if (arr.length != 6) {
          ColorfulPrint.red(
              'ERROR: Invalid number of fields\n make sure you follow the rquired format');
        } else {
          try {
            var numAge = int.parse(arr[2]);
            var numSalary = double.parse(arr[4]);
            var selectedRole =
                arr[5] == 'm' ? EmployeeRole.manager : EmployeeRole.employee;
            var newEmployee = Employee(
                name: arr[0],
                phoneNum: arr[1],
                age: numAge,
                jobDescription: arr[4],
                salary: numSalary,
                role: selectedRole);
            if (newEmployee.validEntry()) {
              allEmployees.add(newEmployee);
              ColorfulPrint.green('New Employee Added!');
            } else {
              ColorfulPrint.red('Failed to add Employee!');
            }
          } catch (_) {
            ColorfulPrint.red(
                'ERROR: Invalid Input. Age and Salary fields are numbers only');
          }
        }
      }
    } while (!shouldExit);
  }

  void selectEmployeeToEdit() {
    fetchEmployees(showAll: true);
    ColorfulPrint.magenta('Select an Employee ID to Edit');
    var userInput = stdin.readLineSync();
    List<Employee> arr =
        allEmployees.where((emp) => emp.id.toString() == userInput!).toList();
    if (arr.isNotEmpty) {
      var employee = arr.first;
      editEmployee(user: employee);
    } else {
      ColorfulPrint.red('ERROR: No employee found under id: $userInput!');
    }
  }

  void deleteEmployee() {
    fetchEmployees(showAll: true);
    ColorfulPrint.magenta('Select an Employee ID to Delete');
    var userInput = stdin.readLineSync();
    List<Employee> arr =
        allEmployees.where((emp) => emp.id.toString() == userInput!).toList();
    if (arr.isNotEmpty) {
      var employee = arr.first;
      if (employee.id == currentUser!.id) {
        ColorfulPrint.red('ERROR: Cannot delete current user');
      } else {
        allEmployees.remove(employee);
        ColorfulPrint.green('${employee.name} Deleted!');
      }
    } else {
      ColorfulPrint.red('ERROR: No employee found under id: $userInput!');
    }
  }
}
