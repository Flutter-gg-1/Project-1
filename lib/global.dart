import "employee.dart";

//this the defult admin
final Employee admin = Employee(
    id: 1,
    name: "admin",
    salary: 0,
    jobDescriptions: "admin of the system",
    permission: PermissionLevel.admin.toString().split(".").last);
final List<Employee> emps = [admin];

enum PermissionLevel { admin, dev, it }
