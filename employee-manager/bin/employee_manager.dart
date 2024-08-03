import 'package:employee_manager/enum/user_permission.dart';
import 'package:employee_manager/src/user.dart';

/*
*
* Main function
*
* */
void main() {
  // TODO just for testing and see the result, remove it when u finished
  // Init user
  String name = "Fahad Alharbi";
  String password = "1234";
  UserPermission permission = UserPermission.admin;

  // Declare user
  User user = User(name: name, password: password, permission: permission);
  User user2 = User(name: name, password: password, permission: permission);

  List<Map<String, dynamic>> x = [user.toJson(), user2.toJson()];
  print(x);
}
