import 'dart:io';

import 'package:employee_manager/src/user.dart';

import '../db/global_users_data.dart';

/**
 *
 * Employee class
 */
class Employee extends User {
  String? position;
  String? jobDescription;
  double? salary;

  // Employee constructor
  Employee({
    required super.name,
    required super.password,
    required super.permission,
    required this.position,
    required this.jobDescription,
    required this.salary,
  });

  /*
  *
  * Employee Sections
  *
  * */
  // Method to edit user data
  void updateEmployee({required String id}) {
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

      print("Edit his new position");
      String? newPosition = stdin.readLineSync();

      print("Edit his new password");
      String? newJobDescription = stdin.readLineSync();

      print("Edit his new salary");
      double? newSalary = double.parse(stdin.readLineSync()!);

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
      usersAfterUpdate["position"] = newPosition;
      usersAfterUpdate["job_description"] = newJobDescription;
      usersAfterUpdate["salary"] = newSalary;
      globalUsersData[count] = usersAfterUpdate;
    } else {
      print("-----ID user $id not found");
    }
  }

  // Converts the User object to a JSON-compatible format
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'position': position,
      'job_description': jobDescription,
      'salary': salary,

      // Convert the UserPermission enum to a string
      // ex.: UserPermission.admin => ['UserPermission','admin']
      'permission': permission.toString().split('.').last,
    };
  }
}
