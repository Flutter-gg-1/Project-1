import 'dart:io'; // library used to interact with user

// funciton to filter employees by salary
List filterBySalary({required double salary, required Map employees}) {
  List filteredEmployees = [];
  print("Filter methods : ");
  print("1- Higher than or equal to $salary");
  print("2- Lower than or equal to $salary");
  stdout.write("Choose an option : ");
  String? option = stdin.readLineSync();

  /*
    option validation :
      1- shouldn't be empty
      2- should be either 1 or 2
  */
  while (option!.isEmpty || ['1', '2'].contains(option) == false) {
    print("ERROR !! : Invalid option ❌");
    stdout.write("Choose an option : ");
    option = stdin.readLineSync();
  }

  if (option == '1') {
    for (var employee in employees.values) {
      if(employee.salary >= salary) {
        filteredEmployees.add(employee);
      }
    }
  }

  if (option == '2') {
    for (var employee in employees.values) {
      if(employee.salary <= salary) {
        filteredEmployees.add(employee);
      }
    }
  }
  
  return filteredEmployees;
}