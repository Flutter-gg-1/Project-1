import 'colors.dart';

pannel() {
  //main pannel
  print("-----" * 9);
  print("|$brightCyanBG&--->Employees Manager<---&   \x1B[0m              |");
  print("|0: Add Employee:                            |");
  print("|1: Modify Employees                         |");
  print("|2: Display Employees                        |");
  print("|Exit write q                                |");
  print("-----" * 9);
}

//modify pannel page
modifyPannel() {
  print('\n\n\n\n\n\n\n\n');
  print("-----" * 9);
  print("|$brightWhiteBG&--->Modify Employees<---&   \x1B[0m               |");
  print("|0: Modify Salary:                           |");
  print("|1: Modify Job Description                   |");
  print("|2: Modify Permission:                       |");
  print("|Exit write q                                |");
  print("-----" * 9);
}

//modify pannel Switch call in add function
permissionsPannel() {
  print("|0: Admin:                        |");
  print("|1: Assistant:                    |");
  print("|2: Employeer                     |");
}
