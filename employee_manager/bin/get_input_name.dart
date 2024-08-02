import 'dart:io';   // library used to interact with user

// function to get name input from user
String getInputName() {
  // ask manager to enter employee name
  stdout.write("Enter employee name : ");
  String? name = stdin.readLineSync();
  // name validation
  while (name!.isEmpty || !name.contains(RegExp('^[a-zA-Z ]+\$'))) {
    print("ERROR !! : Invalid Name ❌\n");
    stdout.write("Enter employee name : ");
    name = stdin.readLineSync();
  }
  return name;
}
