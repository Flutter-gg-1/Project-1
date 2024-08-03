// function to print app menu based on a boolean parameter (modification state)
void appMenu({required String mode}) {
  if (mode == 'main') {
    print('=' * 30);
    print('|   Employee  Manager  App   |');
    print('=' * 30);
    print('| 1 |     View Employees     |');
    print('-' * 30);
    print('| 2 |   Add a New Employee   |');
    print('-' * 30);
    print('| 3 |   Promote an Employee  |');
    print('-' * 30);
    print('| 4 |  Modify Employee Info  |');
    print('-' * 30);
    print('| 5 |   Remove an Employee   |');
    print('-' * 30);
    print('| 0 |          EXIT          |');
    print('=' * 30);
  }
  else if (mode == 'modify') {
    print("*" * 32);
    print('/   1 ----> salary             \\');
    print('/   2 ----> job description    \\');
    print('/   3 ----> add permission     \\');
    print('/   4 ----> delete permission  \\');
    print('/   0 ----> back to main menu  \\');
    print("*" * 32);
  }
  if (mode == 'filter') {
    print("*" * 35);
    print('/   1 ----> view all employees         \\');
    print('/   2 ----> filter by name             \\');
    print('/   3 ----> filter by salary           \\');
    print('/   4 ----> filter by permissions      \\');
    print('/   5 ----> filter by job description  \\');
    print('/   0 ----> back to main menu          \\');
    print("*" * 35);
  }
}
