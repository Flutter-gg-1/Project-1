import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../employee.dart';
import '../employee_mngmt.dart';

Future<String> login() async {
  File file = File('bin/lists/login.json');
  String records = await file.readAsString();
  List members = jsonDecode(records);

  print(blue('\nEnter your Login credentials\n'));
  stdout.write(cyan('ID: '));
  String userID = stdin.readLineSync()!;
  stdout.write(cyan('password: '));
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
    return userID;
  } else {
    print(red('Login failed'));
    return '0';
  }
}

updateLoginList(Employee emp,
    {String? hashedPassword, bool? isToDelete, Map<String, dynamic>? empty}) {
  //Update login.json
  Map<String, dynamic> newLogin = {
    'empID': emp.empID,
    'passwordHash': emp.password
  };

  File loginFile = File('bin/lists/login.json');
  String loginRecords = loginFile.readAsStringSync();
  List temp2 = jsonDecode(loginRecords);

  // update existing login
  bool found = false;
  for (int i = 0; i < temp2.length; i++) {
    if (temp2[i]['empID'] == emp.empID) {
      if (isToDelete != null) {
        found = true;
        temp2[i] = empty;
        break;
      }
      temp2[i]['passwordHash'] = hashedPassword;
      found = true;
      break;
    }
  }

  //update json file
  if (!found) {
    temp2.add(newLogin);
  }
  String updateLogin = jsonEncode(temp2);
  loginFile.writeAsStringSync(updateLogin, mode: FileMode.write);
}

String setPassword(Employee emp) {
  stdout.write(cyan('\nEnter your new password: '));
  String password = stdin.readLineSync()!;
  String hashedPassword = sha256.convert(utf8.encode(password)).toString();
  emp.password = hashedPassword;
  updateLoginList(emp, hashedPassword: hashedPassword);
  return hashedPassword;
}
