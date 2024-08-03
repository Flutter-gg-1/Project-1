import '../core/all_file.dart';
updateEmployeeFunction({
  required int uid,
  required int salary,
  required String descriptions,
}) {
  for (var element in employeeList) {
    if (element['id'].toString().trim() == uid.toString().trim()) {
      employeeList.remove(element);
      break;
    } else {
      print('****** Employee Not Found ******');
      break;
    }
  }
  print('Enter Employee Update Permissions: ');
  print('1. Manager  2. Workers  3. Supervisor ');
  //permissions function call for show permissions values
  String? permissions = showPermissions();
  employeeList.add({
    'id': uid,
    'salary': salary,
    'descriptions': descriptions,
    'permissions': permissions
  });
}
