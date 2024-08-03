import 'dart:io'; // library used to interact with user

// function to get name input from user
String getInputName() {
  // ask manager to enter employee name
  stdout.write("Enter employee name : ");
  String? name = stdin.readLineSync();
  /*
    name validation :
      1- shouldn't be empty
      2- according to the regular expression used, should contain letters and spaces only
      regular expressions : sequence that represents a pattern.
      pattern used :
        - (^) : beginning of string
        - [a-zA-Z]+ : one or more alphabets
        - ( *) : zero or more spaces (in case of last name)
        - [a-zA-Z]* : zero or more alphabets (in case of last name)
  */
  while (name!.isEmpty || !name.contains(RegExp('^[a-zA-Z]+ *[a-zA-Z]*\$'))) {
    print("ERROR !! : Invalid Name ❌\n");
    stdout.write("Enter employee name : ");
    name = stdin.readLineSync();
  }
  return name;
}