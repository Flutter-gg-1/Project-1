import './utlis/menu.dart';
import './utlis/print_with_color.dart';
void main(List<String> arguments) {
Menu display = Menu();

while (true) {
  PrintWithColor.blue('\n\n================Employee Manager===================');
  display.menu();
  
}
}
