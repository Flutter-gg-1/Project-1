import 'print_with_color.dart';

/*
*
* This function will display menu options
*
* */
void displayMenu() {
  // Print menu options
  printWithColor(text: '1. Add Employee', color: 'Blue');
  printWithColor(text: '2. Edit Employee', color: 'Blue');
  printWithColor(text: '3. Get one employee', color: 'Blue');
  printWithColor(text: '4. Get All employee', color: 'Blue');

  // Print with yellow color
  printWithColor(text: '5. Exit');
}
