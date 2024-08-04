import 'dart:io';

import 'package:employee_manager/helpers/generate_random_id.dart';

import '../db/global_users_data.dart';
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

  /*
  *
  * User Sections
  *
  * */
  // Method to edit user data // TODO write a comments
  void updateUser({required String id}) {
    Map<String, dynamic> usersAfterUpdate = {};
    int count = 0;
    for (var element in globalUsersData) {
      if (element["id"] == id) {
        usersAfterUpdate = element;
        break;
      }
      count++;
    }

    if (usersAfterUpdate.isNotEmpty) {
      print("-----ID User ${usersAfterUpdate["id"]}");
      print("Name: ${usersAfterUpdate["name"]}");
      print("Password: ${usersAfterUpdate["password"]}");
      print("Permission: ${usersAfterUpdate["permission"]}");
      print("-------------------------------");
      print('\n');
      print("Edit his new name");
      String? newName = stdin.readLineSync();

      print("Edit his new password");
      String? newPassword = stdin.readLineSync();

      String? newPermission;
      // Check user input if a permission is correct
      do {
        print("Edit his new permission (admin, manager, employee)");
        newPermission = stdin.readLineSync().toString();
      } while (!isPermission(permission: newPermission));

      // Update values
      usersAfterUpdate["name"] = newName;
      usersAfterUpdate["password"] = newPassword;
      usersAfterUpdate["permission"] = newPermission;
      globalUsersData[count] = usersAfterUpdate;
    } else {
      print("-----ID user $id not found");
    }
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
  * Permission Sections
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

  // Method to check if permission in enum or not
  bool isPermission({required String permission}) {
    // Convert enum to list
    var allPermission = UserPermission.values.map((e) => e.name).toList();

    // Return true when user input is a correct permission
    return allPermission.contains(permission);
  }
}
