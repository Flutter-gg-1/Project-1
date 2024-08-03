








 import 'dart:io';

import 'package:project_1/global.dart';
import 'package:project_1/models/departments.dart';

Departments? switchDep(){


  print("\n------ what the name of the department that you want to swithc to  ------\n");


  String depS = stdin.readLineSync()!;


bool found = false;
   for (int i = 0; i < depLis.length; i++) {
        if (depLis[i].depName == depS) {
          
          found = true;
          print("\n------ switch to $depS  ------\n");
          return depLis[i];
        }
      }

      if(!found){
        print("\n ######### sory no department with that name  #########\n");
      }

      return null;


}