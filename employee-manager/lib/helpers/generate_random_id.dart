import 'dart:math';

/*
 *
 * Function to generate random id
 *
 */
String generateRandomId({int len = 5}) {
  var random = Random();
  var id = '';
  for (var i = 0; i < len; i++) {
    id += random.nextInt(10).toString();
  }
  return id;
}
