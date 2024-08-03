/*
*
* This Function to print text with color in console
*
* */
void printWithColor({required dynamic text, String color = "Yellow"}) {
  /**
      Meaning:
      \x1B: ANSI escape sequence starting marker
      [31m: Escape sequence for red
      [0m: Escape sequence for reset (stop making the text red)

      ANSI escape code explanation
      Res: https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html#colors

      Black:   \x1B[30m
      Red:     \x1B[31m
      Green:   \x1B[32m
      Yellow:  \x1B[33m
      Blue:    \x1B[34m
      Magenta: \x1B[35m
      Cyan:    \x1B[36m
      White:   \x1B[37m
      Reset:   \x1B[0m
   **/
  switch (color) {
    case ('Black'):
      print('\x1B[30m$text\x1B[0m');
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
