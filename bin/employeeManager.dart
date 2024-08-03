import 'employee.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen grayPen = AnsiPen()..gray();
final AnsiPen yallowPen = AnsiPen()..yellow();

class EmployeeManager {
  List<Employee> employees = [];
//add employe method
  void addEmployee({
    required String name,
    required double salary,
    required List<String> permissions,
    required String jobDescription,
  }) {
    //متغير يقوم بالبحث عنن متغير اذا موجود من
    bool exists = false;
    for (var employee in employees) {
      if (employee.name == name) {
        exists = true;
        break;
      }
    }
    if (exists) {
      //اذا كان اسم الموظف موجود من قبل
      print(grayPen('Employee $name already exists.'));
    } else {
      // يقوم باضافه موظف
      employees.add(Employee(
        name: name,
        salary: salary,
        permissions: permissions,
        jobDescription: jobDescription,
      ));
      print(greenPen('Employee $name added successfully.'));
    }
  }

  //التعديل على راتب الموظف
  void editSalary({
    required String name,
    required double newSalary,
  }) {
    //list عرفت متغير يبحث عن الموظف في
    bool Found = false;
    for (var employee in employees) {
      if (employee.name == name) {
        Found = true;
        //اذا وجده يقوم بتعديل الراتب
        employee.salary = newSalary;
        print(greenPen('Salary of $name updated to \$$newSalary.'));
        break;
      }
      //اذا غير موجود تطبع له هذه الرساله
      if (!Found) {
        print(yallowPen('Employee $name not found.'));
      }
    }
  }

  void assignPermission({
    required String name,
    required String permission,
  }) {
    // البحث عن الموظف مباشرة في قائمة employees
    bool Found = false;
    for (var employee in employees) {
      if (employee.name == name) {
        Found = true;
        // التحقق مما إذا كانت الصلاحية موجودة بالفعل
        if (!employee.permissions.contains(permission)) {
          employee.permissions.add(permission);
          print(greenPen('Permission $permission added to $name.'));
        } else {
          print(yallowPen('Permission $permission already exists for $name.'));
        }
        break; // أوقف البحث بعد العثور على الموظف
      }
    }
    //اذا غير موجود تطبع له هذه الرساله

    if (!Found) {
      print(yallowPen('Employee $name not found.'));
    }
  }

  void editJobDescription({
    required String name,
    required String newDescription,
  }) {
    //list عرفت متغير يبحث عن الموظف في
    bool Found = false;
    for (var employee in employees) {
      if (employee.name == name) {
        Found = true;
        //jobDescription اذا موجود الموظف تتحدث
        employee.jobDescription = newDescription;
        print(greenPen('Job description of $name updated.'));
        break;
      }
      //اذا غير موجود تطبع له هذه الرساله
      if (!Found) {
        print(yallowPen('Employee $name not found.'));
      }
    }
  }

//تعرض له بيانات الموظفين كامله case 2عند الضغط على
  void displyEmployees() {
    if (employees.isEmpty) {
      print(yallowPen('No employees to display.'));
    } else {
      for (var employee in employees) {
        employee.display();
      }
    }
  }
}
