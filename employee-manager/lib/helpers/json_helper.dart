import 'dart:convert';
import 'dart:io';

import 'print_with_color.dart';

/*
*
* This class provide a functions works with json
* w
* */
class JsonHelpers {
  ///  Reads a JSON file from the given [filePath] and returns a [Map<String, dynamic>] representation of the JSON.
  ///  If an error occurs, an empty [Map] is returned.
  ///  <List<Map<String, dynamic>>>
  static Future readJsonFile(String filePath) async {
    try {
      //  Reads the file from the given [filePath].
      final file = File(filePath);
      //  Decodes the contents of the file as a [String].
      final contents = await file.readAsString();
      //  Decodes the [contents] as a JSON.
      // final json = await jsonDecode(contents);
      final json = await jsonDecode(file.readAsStringSync())
          as List<Map<String, dynamic>>;

      //  Returns the decoded JSON.
      return json;
    } catch (e) {
      // print the error massage
      printWithColor(text: 'Error reading JSON file: $e', color: 'Red');
    }
  }

  /// Save a data in JSON as a [List] of [Map]<String,dynamic>
  static Future<void> writeJsonFile(
      {required String filePath,
      required List<Map<String, dynamic>> data}) async {
    try {
      //  Encodes the [json] as a JSON.
      final contents = jsonEncode(json);
      //  Writes the [contents] to the file at the given [filePath].
      final file = File(filePath);
      await file.writeAsString(contents);
    } catch (e) {
      // print the error massage
      printWithColor(text: 'Error writing JSON file: $e', color: 'Red');
    }
  }
}
