import 'dart:io'; // library used to interact with user

// function to get id input from user
int getInputID(Map employees) {
  // ask manager to enter employee id
  stdout.write("Enter employee ID : ");
  String? id = stdin.readLineSync();
  /*
    id validation :
      1- shouldn't be empty
      2- should be a number
      3- should exist in the employees map
  */
  while (id!.isEmpty || int.tryParse(id) == null || !employees.containsKey(int.parse(id))) {
    print("ERROR !! : Invalid ID ❌\n");
    stdout.write("Enter employee ID : ");
    id = stdin.readLineSync();
  }
  return int.parse(id);
}