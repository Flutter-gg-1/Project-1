import 'dart:io';
import 'accounts.dart';
import 'colors.dart';
import 'package:intl/intl.dart';


addEmployee({required String empName, required double empSalary, required String jobTitle}) {
  String getDateOnly = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var account = {
    "id": nextID++,
    "name": empName,
    "jobTitle": jobTitle,
    "salary": empSalary,
    "permission": false,
    "dateCreated":getDateOnly
  };

  accounts.add(account);
  print("$yellowBG $red Your ID is : ${account["id"]} $reset");
  stdin.readLineSync();
}
