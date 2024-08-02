import './global_variabels.dart';

class Home {
  static void instruction() {
    print('''

    1 | Add new employee
    2 | Display all employees
    3 | Update an employee
    4 | Assign permission to an employee
    C | Exit
  
  
  ''');
  }

  static void userInput(String str) {
    switch (str) {
      case '1':
        print("add new employee");
      case '2':
        print("Display all employee");
      case '3':
        print("Update an employee");
      case '4':
        print("Assign permission to an employee");
      case 'C':
        print("Exit");
        isExit = true;

      default:
        isExit = true;
    }
  }
}
