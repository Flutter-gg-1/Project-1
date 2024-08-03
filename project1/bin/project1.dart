import 'print_with_color.dart';
import 'features.dart';

/* 
    This is the main function
*/

void main(List<String> arguments) {
  const greeting = "   _____Welcome to Employee Manager applicatin_____\n";
  print("\n\n");
  printWithColor(text: greeting, color: "Cyan");
  features();
}
