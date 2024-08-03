






import 'dart:io';

import 'package:project_1/global.dart';
import 'package:project_1/models/departments.dart';

addDep(){

print("\n------ what the name of the new department  ------\n");

  String depName =  stdin.readLineSync()!;

  Departments dep = Departments(depName: depName);

  depLis.add(dep);
}