import 'dart:io';
import '../all_file.dart';
void deleteEmployee(){
    print('\n_____________# Delete Employee #___________\n');
    print('Enter Employee ID: ');
    final int id = int.parse(stdin.readLineSync()!);
    for (var element in employeeList) {
      if (element['id'].toString().trim() == id.toString().trim()) {
        print(element);
        employeeList.remove(element);
        break;
      }
    }
    print('\nEmployee Deleted Successfully\n');

}