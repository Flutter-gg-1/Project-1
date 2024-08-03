class PrintWithColors {
  static void yellow(String text) => print('\x1B[33m$text\x1B[0m');
  static void green(String text) => print('\x1B[32m$text\x1B[0m');
  static void red(String text) => print('\x1B[31m$text\x1B[0m');
  static void cyan(String text) => print('\x1B[36m$text\x1B[0m');
  static void blue(String text) => print('\x1B[34m$text\x1B[0m');
  static void reset(String text) => print('\x1B[0m$text\x1B[0m');
}
