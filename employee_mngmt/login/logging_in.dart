import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
// import '../bin/employee.dart';


Future<String> login() async{
  File file = File('login/login.json');
  String records = await file.readAsString();
  List members = jsonDecode(records);

  print('Enter your Login credentials: ');
    stdout.write('ID: ');
    String userID = stdin.readLineSync()!;
    stdout.write('password: ');
    String password = stdin.readLineSync()!;
    String hash = sha256.convert(utf8.encode(password)).toString();

    bool loginSuccess = false;
    for (var member in members) {
      if (member['empID'] == userID && member['passwordHash'] == hash) {
        loginSuccess = true;
        break;
      }
    }

    if (loginSuccess) {
      print('\n---Welcome $userID---');
      return userID;
    } else {
      print('Login failed');
      return '0';
    }
}