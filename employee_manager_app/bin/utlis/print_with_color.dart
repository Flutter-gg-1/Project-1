class PrintWithColor {
  static void red(text)=>print('\x1B[31m$text\x1B[0m');
  static void green(text)=>print('\x1B[32m$text\x1B[0m');
  static void blue(text)=>print('\x1B[34m$text\x1B[0m');
  static void purple(text)=>print('\x1B[35m$text\x1B[0m');
}