import 'dart:io';
import 'accounts.dart';
import 'colors.dart';

givePermission() {
  for (var element in accounts) {
    print('$red----------------------------------$reset');
    print('$blue Account ID: ${element["id"]}$reset');
    print('$green Name: ${element['name']}$reset');
    print('$green Permission: ${element["permission"]== false? "$redBG$black false " : "$greenBG$black true "}$reset');
    print('$red----------------------------------$reset');
  }
  stdout.write("Give permission to [Enter their ID] : ");
  int? userInputID = int.tryParse(stdin.readLineSync()!);
  if (userInputID == null){ // If not a number
    print("Invalid input. ");
    stdin.readLineSync();
    return;
  }
    bool isLoggedIn = false;
    for (var element in accounts) {
      if (userInputID == element["id"]) {
        isLoggedIn = true;
      }
    }
    if (isLoggedIn) {
      accounts[userInputID-1]["permission"] = true;
      print("${accounts[userInputID-1]["name"]} have access to data now! ");
      stdin.readLineSync();

    } else {
      print("Wrong ID");
      stdin.readLineSync();
    }
}
