import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen blackPen = AnsiPen()..black();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen magentapen = AnsiPen()..magenta();

// هذا الكلاس بعرض بيانات الموظف
class Employee {
  String name;
  double salary;
  //list يخزن الصلاحيات
  List<String> permissions;
  String jobDescription;
  Employee({
    required this.name,
    required this.salary,
    required this.permissions,
    required this.jobDescription,
  });
  void display() {
    print('${greenPen('Name:')} ${magentapen(name)}');
    print(('${greenPen('salary:')} ${magentapen(salary)}'));
    print('${greenPen('permissions:')} ${magentapen(permissions)}');
    print('${greenPen('Job Description:')} ${magentapen(jobDescription)}');
    print(blackPen(
        '--------------------------------------------------------------'));
    print(blackPen('............................................'));
  }
}
//done
