import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/storage.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
display(){
Storage.info.forEach((key, value) => PrintWithColor.green('$key $value'),);
}