// function to print app menu based on a boolean parameter
void appMenu({required bool modify}) {
  if (!modify) {
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
    print('| 5 |     Remove Employee    |');
    print('-' * 30);
    print('| 0 |          EXIT          |');
    print('=' * 30);
  }
  else {
    print('1- salary');
    print('2- job description');
    print('3- add permission');
    print('4- delete permission');
    print('0- back to main menu');
    print("*" * 30);
  }
}
