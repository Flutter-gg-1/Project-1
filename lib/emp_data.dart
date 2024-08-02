import 'dart:io';

import 'package:ems/employee.dart';

import 'global.dart';

void addEmployee(Employee emp) {
  late int id;
  if (emps.isEmpty) {
    id = 1;
  } else {
    id = emps.last.id + 1;
    emp.id = id;
    emps.add(emp);
    print("add was seccuss");
    emp.printEmployeeInfo();
  }
}

void printAllEmployees() {
  for (var emp in emps) {
    print("* " * 12);
    emp.printEmployeeInfo();
  }
}


