/*
This Function to print text with color in console
 */
void printWithColor({required dynamic text, String color = "Yellow"}) {
  switch (color) {
    case ('Black'):
      print('\x1B[90m$text\x1B[0m');
      break;
    case ('Red'):
      print('\x1B[31m$text\x1B[0m');
      break;
    case ('Green'):
      print('\x1B[32m$text\x1B[0m');
      break;
    case ('Yellow'):
      print('\x1B[33m$text\x1B[0m');
      break;
    case ('Blue'):
      print('\x1B[34m$text\x1B[0m');
      break;
    case ('Magenta'):
      print('\x1B[35m$text\x1B[0m');
      break;
    case ('Cyan'):
      print('\x1B[36m$text\x1B[0m');
      break;
    case ('White'):
      print('\x1B[37m$text\x1B[0m');
      break;
    case ('Reset'):
      print('\x1B[0m$text\x1B[0m');
      break;
    default:
      print('\x1B[33m$text\x1B[0m');
  }
}
