import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/models/storage.dart';
import'/Users/basel/Desktop/flutter bootcamp/assignments/Project-1/employee_manager_app/bin/utlis/print_with_color.dart';
class Track{
  static Map<String,List> log = {};
  static DateTime time = DateTime.now();

  static addToLog({
    required String name,
    required String opration,
  }){
    /* if it the first time i initlaize
      the new key and if is the key allready there i wil only add 
      value to it
      */
    if (!log.containsKey(name)) {
      log.addAll({name:['opration : $opration','Time : $time']});

    }else{
     log[name]?.addAll(['\nopration : $opration','Time : $time']);
    }
  }



   static void printLog({
    required String employeeName,
    required String name,
    Function(List)? callback
  }){
      String permission = Storage.info[name]?[3];
    List spicficUserLog = [];
   if (callback!=null) {
     if (Storage.info.containsKey(name)&&permission!='Permission : A') {
       PrintWithColor.red('you do not have the acsses');
     } else {
       spicficUserLog.addAll(log[employeeName] ?? []);
     callback(spicficUserLog);
     }
     
   } 
  }
}