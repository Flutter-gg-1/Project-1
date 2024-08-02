import 'dart:io';

double getInputSalary() {
  // ask manager to enter employee salary
  stdout.write("Enter employee salary in SR : ");
  String? salary = stdin.readLineSync();
  // salary validation
  while (salary!.isEmpty || double.tryParse(salary) == null) {
    print("ERROR !! : Invalid Salary\n");
    stdout.write("Enter employee salary in SR : ");
    salary = stdin.readLineSync();
  }
  return double.parse(salary);
}
