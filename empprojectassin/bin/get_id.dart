import 'dart:io';

String empID = 'www';
bool isFound = true;
//get key id value employee map
int getIDMap(List<Map<String, dynamic>> empDetails) {
  bool isGetid = false;
  stdout.write('Enter Employee ID: ');
  String empInputID = stdin.readLineSync()!;

  for (var element in empDetails) {
    isGetid = element.values.contains(empInputID);
  }

  if (empInputID.isEmpty || isGetid == false) {
    empInputID = '0';
    isFound = false;
  } else {
    isFound = true;
  }
  return int.parse(empInputID);
}

//get a spesific index from List by a spesific id map
String getIndexList(List<Map<String, dynamic>> empDetails) {
  empID = getIDMap(empDetails).toString();
  if (isFound) {
    int counterIndex = 0;
    for (int i = 0; i < empDetails.length; i++) {
      if (empDetails[i].values.contains(empID)) {
        empID = counterIndex.toString();
      }
      counterIndex++;
    }
    return empID;
  } else {
    return 'null';
  }
}
