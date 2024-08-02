




/* here is class for departments 
is used for when the Company have muti Employees
in evry Departments


*/
class Departments {

var  lisEmployees = [];

late final int id ;
final  String depName;

static int idCounter = 0;

// evry time new Departments obj is made we give it id
Departments({required this.depName}){

  idCounter +=1;

  id = idCounter;

}




addEmp({ required String name ,required double salary ,required String permissions ,required String jobDecs}){


  lisEmployees.add({

    "name" : name,
    "salary" : salary ,
    "permissions" : permissions,
    "jobDecs" : jobDecs
    

  });

}


}