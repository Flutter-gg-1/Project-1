class Employee {
  late int id;
  late String name;
  late String jobDescriptions;
  late int salary;
  late String permissions;
  Employee(
      {required this.id,
      required this.name,
      required this.salary,
      required this.jobDescriptions,
      required this.permissions});

  void printEmployeeInfo() {
    print(
        "ID:$id\nName: $name\nJob description: $jobDescriptions\nSalary: $salary\nPermission: $permissions ");
  }
}
