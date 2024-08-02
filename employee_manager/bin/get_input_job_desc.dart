import 'dart:io';

String getInputJobDesc() {
  // ask manager to enter employee job desription
  stdout.write("Enter employee job description : ");
  String? jobDesc = stdin.readLineSync();
  // job description validation
  while (jobDesc!.isEmpty) {
    print("ERROR !! : Invalid job description\n");
    stdout.write("Enter employee job description : ");
    jobDesc = stdin.readLineSync();
  }
  return jobDesc;
}
