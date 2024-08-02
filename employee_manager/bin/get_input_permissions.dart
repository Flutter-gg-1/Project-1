import 'dart:io';

List getInputPermissions({required String name}) {
  // ask manager if employee has current permissions
  List permissions = [];
  stdout.write("How many permissions does $name have (0-3) ? : ");
  String? numOfPermissions = stdin.readLineSync();
  // number validation
  while (numOfPermissions!.isEmpty ||
      !['0', '1', '2', '3'].contains(numOfPermissions)) {
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