import 'dart:io';
import 'accounts.dart';
import 'colors.dart';

employeeList() {
  for (var element in accounts) {
    print('$red----------------------------------$reset');
    print('$blue Account ID: $reset$red${element["id"]}$reset');
    print('$brightGreen Name: $reset$green${element['name']}$reset');
    print('$brightGreen Job Title: $reset$green${element['jobTitle']}$reset');
    print('$brightGreen Salary: $reset$green${element['salary']}$reset');
    print('$brightGreen Date Created: $reset$green${element['dateCreated']}$reset');
    print('$brightGreen Permission: $reset$green${element["permission"]== false? "$redBG$black false " : "$greenBG$black true "}$reset');
    print('$red----------------------------------$reset');
  }
  stdin.readLineSync();
}