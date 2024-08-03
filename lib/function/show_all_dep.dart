






// this method will show all Department in the system

import 'package:project_1/global.dart';

showAllDep(){
 print("\n\n");
    print("#" * 50);

    for (var val in depLis) {
      print("\n");
      
        print("####  ${val.depName}    ####");
      
    }

    print("\n\n");
    print("#" * 50);


}