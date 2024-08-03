import 'dart:io'; // library used to interact with user

// function to get job description input from user
String getInputJobDesc() {
  // ask manager to enter employee job description
  stdout.write("Enter employee job description : ");
  String? jobDesc = stdin.readLineSync();
  
  // job description validation (shouldn't be empty)
  while (jobDesc!.isEmpty) {
    print("ERROR !! : Invalid job description ❌\n");
    stdout.write("Enter employee job description : ");
    jobDesc = stdin.readLineSync();
  }
  return jobDesc;
}
