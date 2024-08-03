import 'dart:ffi';
import 'dart:io';

import 'package:project_1/global.dart';
import 'package:project_1/models/departments.dart';

// here where the app start
runApp(Departments mainDep) {



// op for switch betwhen the instruction
  String op = "1";

  const String op1 = "0: Add a New Employee:";
  const String op2 = "1: update info Employee:";
  const String op3 = "2: Show all Employee  :";
  const String op4 = "3: Add a New Departments :";
  const String op5 = "4: Show All Departments :";
  const String op6 = "5: exit:";

  


  const String serId = "id";
  const String serNAme = "name";

  

  while (op != "5") {

    
    print("\n\n");

    print(op1);
    print("-" * 25);
    print(op2);
    print("-" * 25);
    print(op3);
    print("-" * 25);
    print(op4);
    print("-" * 25);
    print(op5);
    print("-" * 25);
    print(op6);

    op = stdin.readLineSync()!;

    switch (op) {
      case "0":
        print("*" * 50);

        print("\n------ give me the name ------");
        String name = stdin.readLineSync()!;

        print("\n------ give me the salary ------");
        double salary = double.parse(stdin.readLineSync()!);

        print("\n------ give me the jobDecs ------");
        String jobDecs = stdin.readLineSync()!;

        print("\n------ chose betwen the permissions ------\n");

        print("0 -  $permR");
        print("-" * 25);
        print("1-  $permW");
        print("-" * 25);
        print("2 -  $permA");
        print("-" * 25);

        String permissions = stdin.readLineSync()!;

        // user here have to chose from the 3 option of permissions
whileBreak :
         while(true){
        switch(permissions){
          case "0" :
          mainDep.addEmp(name: name, salary: salary, permissions: permR, jobDecs: jobDecs);
          break whileBreak;

          case "1" :
          mainDep.addEmp(name: name, salary: salary, permissions: permW, jobDecs: jobDecs);
          break whileBreak;

          case "2" :
          mainDep.addEmp(name: name, salary: salary, permissions: permA, jobDecs: jobDecs);
          break whileBreak;

          default :
          print("erorr palce give permissions form the 3 option ");

          
        }
         }

        break;

      case "1":

      print("*" * 50);


       print("\n------ how you want to serch  ------\n");

       print("0 -  $serNAme");
        print("-" * 25);
        print("1-  $serId");
        print("-" * 25);
        String serOp = stdin.readLineSync()!;
whileBreak :
       while(true){

        switch(serOp){

          case "0" :
          mainDep.serEmp(false);

          break whileBreak;

          case "1" :
          mainDep.serEmp(true);

          break whileBreak;

          default:
          print("\n ----- eorr place chose betwen 0 or 1 ---- \n");
          serOp = stdin.readLineSync()!;
        }

       }

        break;

      case "2":

      mainDep.showAllEmp();
        break;

      case "3":
        break;

      case "4":
        break;

      case "5":
        break;
    }
  }
}
