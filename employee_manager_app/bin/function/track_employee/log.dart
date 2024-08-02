
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
    required String name,
    Function(List)? callback
  }){
    List spicficUserLog = [];
   if (callback!=null) {
     
     spicficUserLog.addAll(log[name] ?? []);
     callback(spicficUserLog);
   } 
  }
}