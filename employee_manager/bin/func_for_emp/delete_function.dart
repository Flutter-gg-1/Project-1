import '../core/all_file.dart';

deleteEmployeeFunction({required int uid}) {
  for (var element in employeeList) {
    if (element['id'].toString().trim() == uid.toString().trim()) {
      print(element);
      employeeList.remove(element);
      print('\nn_____________# Employee Deleted Successfully #___________\n');
      break;
    } else {
      print('****** Employee Not Found ******');
      break;
    }
  }
}
