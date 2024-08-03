import 'package:employee_manager/helpers/generate_random_id.dart';

import '../enum/user_permission.dart';

/*
 *
 * User class
 * It's for user and permission management
 *
 * */
class User {
  // init user_id, name, password
  String? id, name, password;

  // user permission ( admin / manager / employee )
  UserPermission permission;

  // User constructor
  User({required this.name, required this.password, required this.permission}) {
    //  Generate a random id for the user
    id = generateRandomId();
  }

  // Converts the User object to a JSON-compatible format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,

      // Convert the UserPermission enum to a string
      // ex.: UserPermission.admin => ['UserPermission','admin']
      'permission': permission.toString().split('.').last,
    };
  }

  /*
  *
  * Method for permissions check
  *
  * */
  // Method to check if user has admin permission
  bool isAdmin() {
    return permission == UserPermission.admin;
  }

  // Method to check if user has manager permission
  bool isManager() {
    return permission == UserPermission.manager;
  }

  // Method to check if user has employee permission
  bool isEmployee() {
    return permission == UserPermission.employee;
  }
}
