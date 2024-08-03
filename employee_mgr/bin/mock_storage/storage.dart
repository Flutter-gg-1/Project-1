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
              age: 24,
              salary: 4320.64),
          Employee(
              name: 'Richard Smith',
              phoneNum: '1234446688',
              age: 32,
              salary: 7810.64,
              role: EmployeeRole.manager),
          Employee(
              name: 'Jack Sparrow',
              phoneNum: '1234446688',
              age: 23,
              salary: 3564.12,
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
      var temp = employees.firstWhere((e) => e.id.toString() == userInput!,
          orElse: () => Employee(name: '', phoneNum: '', age: -1, salary: -1));

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
  void addNewEmployee() {
    var shouldExit = false;
    ColorfulPrint.magenta('Creating a new Employee');
    do {
      print('''

          Enter the details in the following format: 
          \x1B[33mName  -  Phone   -  Age  -  Salary   -  Role\x1B[0m
                 (numbers)  (number) (number) (1 = employee, 2 = mgr)

          e.g:
          \x1B[33mJohn Doe - 0501112222 - 45 - 800 - 1\x1B[0m


          To cancel and go back enter 'b'
       ''');

      var userInput = stdin.readLineSync();
      var arr = userInput!.split('-');
      if (arr.length != 5) {
        ColorfulPrint.red('ERROR: Invalid number of fields');
      } else {
        try {
          var numAge = int.parse(arr[2]);
          var numSalary = double.parse(arr[3]);
          // addNew(
          //     name: arr[0],
          //     phoneNum: arr[1],
          //     age: numAge,
          //     salary: numSalary,
          //     role: arr[4]);
        } catch (_) {
          ColorfulPrint.red('ERROR: Invalid Input');
        }
      }
    } while (!shouldExit);
  }

  void selectEmployeeToEdit() {
    fetchEmployees(showAll: true);
    ColorfulPrint.magenta('Select an Employee ID to edit');
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
}
