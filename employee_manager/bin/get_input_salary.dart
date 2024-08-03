import 'dart:io'; // library used to interact with user

// function to get salary input from user
double getInputSalary() {
  // ask manager to enter employee salary
  stdout.write("Enter employee salary in SR : ");
  String? salary = stdin.readLineSync();
  /*
    salary validation
      1- shouldn't be empty
      2- should be a number
  */
  while (salary!.isEmpty || double.tryParse(salary) == null) {
    print("ERROR !! : Invalid Salary ❌\n");
    stdout.write("Enter employee salary in SR : ");
    salary = stdin.readLineSync();
  }
  return double.parse(salary);
}