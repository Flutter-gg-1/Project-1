



import 'package:project_1/function/run_app.dart';
import 'package:project_1/global.dart';
import 'package:project_1/models/departments.dart';

void main(){

// here we make the main Department and from it the admin can add new Departments and it is Employes
  Departments mainDep =  Departments(depName: "main_dep");



  depLis.add(mainDep);

  runApp(depLis[0]);
}