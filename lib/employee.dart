class Employee {
  late int id;
  late String name;
  late String jobDescriptions;
  late double salary;
  late String permission;
  Employee(
      {required this.id,
      required this.name,
      required this.salary,
      required this.jobDescriptions,
      required this.permission});

  void printEmployeeInfo() {
    print("*******************");
    print(
        "ID:$id\nName: $name\nJob description: $jobDescriptions\nSalary: $salary\nPermission: $permission ");
    print("*******************");
  }
}
