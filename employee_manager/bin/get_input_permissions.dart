import 'dart:io'; // library used to interact with user

// function to get permissions input from user
List getInputPermissions({required String name}) {
  // ask manager how many permissions
  List permissions = [];
  stdout.write("How many permissions do you want $name to have ? (0-3) : ");
  String? numOfPermissions = stdin.readLineSync();
  /*
    number validation
      1- shouldn't be empty
      2- should be either 0,1,2, or 3
  */
  while (numOfPermissions!.isEmpty || !['0', '1', '2', '3'].contains(numOfPermissions)) {
    print("ERROR !! : Invalid number ❌\n");
    stdout.write("How many permissions does $name have (0-3) ? : ");
    numOfPermissions = stdin.readLineSync();
  }
  
  // add permissions
  for (int i = 0; i < int.parse(numOfPermissions); i++) {
    stdout.write("Enter permission ${i + 1} : ");
    permissions.add(stdin.readLineSync());
  }
  return permissions;
}