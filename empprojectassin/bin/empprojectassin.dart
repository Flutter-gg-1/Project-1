import 'dart:io';

void main() {
  bool isExit = false;

  do {
    //pannel();
    var inputUser = stdin.readLineSync();
    switch (inputUser) {
      case '0':
        break;
      case '1':
        break;
      case '2':
        break;
      case '3':
        break;
      //Exit
      case 'q' || 'Q':
        isExit = true;
        break;
      default:
        print('please only write the showing number');
    }
  } while (!isExit);
}
