import 'dart:io';

int getInputID() {
  // ask manager to enter employee id
  stdout.write("Enter employee ID : ");
  String? id = stdin.readLineSync();
  // id validation
  while (id!.isEmpty || int.tryParse(id) == null) {
    print("ERROR !! : Invalid ID\n");
    stdout.write("Enter employee ID : ");
    id = stdin.readLineSync();
  }
  return int.parse(id);
}