import 'dart:io';

import './home.dart';
import './global_variabels.dart';

void main() {
  Home.instruction();
  do {
    var userInput = stdin.readLineSync();
    Home.userInput(userInput!);
  } while (!isExit);
}
