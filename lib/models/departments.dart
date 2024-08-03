




/* here is class for departments 
is used for when the Company have muti Employees
in evry Departments


*/
import 'dart:io';

import 'package:project_1/global.dart';

class Departments {

var  lisEmployees = [];

late final int id ;
final  String depName;

static int idCounter = 0;

static int empIdCunter = 0;



// evry time new Departments obj is made we give it id
Departments({required this.depName}){

  idCounter +=1;

  id = idCounter;

}




addEmp({ required String name ,required double salary ,required String permissions ,required String jobDecs}){


  lisEmployees.add({
     "id" : ++empIdCunter ,
    "name" : name,
    "salary" : salary ,
    "permissions" : permissions,
    "jobDecs" : jobDecs
    

  });

  print(lisEmployees);

}


// the bool will be use if the user want to serch by id or by name if false
serEmp(bool withId){

// will be used to check if emp is found or not 
  bool found = false ;

  if(withId == true){

    print("\n------ give me the id ------");
   String empId = stdin.readLineSync()!;


   for(int i = 0 ; i < lisEmployees.length ; i++){

    if(lisEmployees[i]["id"].toString() == empId){
      editemp(i);
      found = true;
      break;

    }
   }


  }else{

     print("\n------ give me the name ------");
     String empName = stdin.readLineSync()!;

    for(int i = 0 ; i < lisEmployees.length ; i++){

    if(lisEmployees[i]["name"].toString() == empName){
      found = true;
      editemp(i);
      break;
      

    }



  }


}


if(!found){
    print("\n ######### sory no emply with that name or id");
  }

}


// here after we found emply the mehod will handle the edit
editemp(int index){


  String nameOp = "name";
  String salOp = "salary";
  String perOp = "permissions";
  String jobDecsOp = "jobDecs";

  

whileBreak :
        while(true)
        {

          print("\n------ chose betwen the what you to edit ------\n");

        print("0 -  $nameOp");
        print("-" * 25);
        print("1-  $salOp");
        print("-" * 25);
        print("2 -  $perOp");
        print("-" * 25);
        print("3 -  $jobDecsOp");
        print("-" * 25);
        print("4 - exit");
        print("-" * 25);

          String op = stdin.readLineSync()!;

          switch(op){
            

            case "0" :
            print("\n------ give me the new name ------");
            String empName = stdin.readLineSync()!;
            lisEmployees[index]["name"] = empName;

            // break whileBreak;
            break;


            case "1" :

            print("\n------ give me the new salry add (-) if you want to reduse the salry  ------");
            
            double empSalry = double.parse(stdin.readLineSync()!);
            
            double preSalry = lisEmployees[index]["salary"];

            if(empSalry < 0){

              if(empSalry.abs() > preSalry){
                print("sory place lower the salary not bleow zero");

              }
              else{
                lisEmployees[index]["salary"] = preSalry + empSalry;
                // break whileBreak;
                break;
              }

              


            }else{
              lisEmployees[index]["salary"] = preSalry + empSalry;
              // break whileBreak;
              break;

            }


            

            case "2" :

            print("\n------ chose betwen the permissions ------\n");

        print("0 -  $permR");
        print("-" * 25);
        print("1-  $permW");
        print("-" * 25);
        print("2 -  $permA");
        print("-" * 25);

        String permissions = stdin.readLineSync()!;


        switch(permissions){
          case "0" :
          lisEmployees[index]["permissions"] = permR  ;
          // break whileBreak;
          break;

         

          case "1" :
          lisEmployees[index]["permissions"] = permW  ;
          // break whileBreak;
          break;
          
          case "2" :
          lisEmployees[index]["permissions"] = permA  ;
          // break whileBreak;
          break;
          

          default :
          print("\n ####  erorr palce give permissions form the 3 option   #### \n ");

          


        }
        break;


          


          case "3" :

          print("\n------ give me the new jobDecs ------");
            String jobDecs = stdin.readLineSync()!;
            lisEmployees[index]["jobDecs"] = jobDecs;

            // break whileBreak;
            break;


            case "4" :
            break whileBreak;


          }

          print("#"*25);


          

        }
}



showAllEmp(){

  print("\n\n");
print("#"*50);

  for(var val in lisEmployees ){

print("\n");
    for(var key in val.keys){

      print("$key ----->   ${val[key]}");
    }
  }



  print("\n\n");
 print("#"*50);
}
}