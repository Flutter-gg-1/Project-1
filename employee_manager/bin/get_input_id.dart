import 'dart:io';

int getInputID(Map employees) {
  // ask manager to enter employee id
  stdout.write("Enter employee ID : ");
  String? id = stdin.readLineSync();
  // id validation
  while (id!.isEmpty || int.tryParse(id) == null || !employees.containsKey(int.parse(id))) {
    print("ERROR !! : Invalid ID\n");
    stdout.write("Enter employee ID : ");
    id = stdin.readLineSync();
  }
  return int.parse(id);
}