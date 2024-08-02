import "employee.dart";

Employee admin = Employee(
    id: 0,
    name: "admin",
    salary: 0,
    jobDescriptions: "admin of the system",
    permission: PermissionLevel.admin.toString());
List<Employee> emps = [admin];

enum PermissionLevel { admin, dev, it }
