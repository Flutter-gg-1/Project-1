import 'dart:io';
import 'accounts.dart';
import 'colors.dart';

displayData({required int id}) {
  bool isLoggedIn = false;
  Map<String, dynamic> account = {};
  for (var element in accounts) {
    if (element['id'] == id) {
      isLoggedIn = true;
      account = element;
    }
  }
    if (isLoggedIn) {
      print('$red----------------------------------$reset');
      print('$blue Account ID: ${account["id"]}$reset');
      print('$green Name: ${account['name']}$reset');
      print('$blue Job Title: ${account['jobTitle']}$reset');
      print('$green Salary: \$${account["salary"]}$reset');
      print('$blue Permission: ${account["permission"]}$reset');
      print('$green Date Created ${account['dateCreated']}$reset');
      print('$red----------------------------------$reset');
      stdin.readLineSync();
    } else {
      print("Wrong ID ");
      stdin.readLineSync();
    }
  }

