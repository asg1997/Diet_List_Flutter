import 'dart:convert';
import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:http/http.dart' as http;

class JsonDecoderService {
  static Future<T> decodeCyrillicJSONObject<T>(
      {required http.Response response}) async {
    // К нам пришло содержимое, но оно отобрадается некорректно,
    // потому что там есть киррилические символы.
    // Чтобы поправить ситуацию, мы конвертируем полученный ответ в байты
    final converted = response.bodyBytes;
    // А потом из байтов уже конвертируем в формат UTF8
    // И из этого формата конвертируем json
    Map<String, dynamic> map = json.decode(utf8.decode(converted));

    List<T> data = map[0];
    return data[0];
  }

  static Future<List<String>> decodeDietList(
      {required http.Response response}) async {
    // К нам пришло содержимое, но оно отобрадается некорректно,
    // потому что там есть киррилические символы.
    // Чтобы поправить ситуацию, мы конвертируем полученный ответ в байты
    final converted = response.bodyBytes;
    // А потом из байтов уже конвертируем в формат UTF8
    // И из этого формата конвертируем json
    final decodedArray = (jsonDecode(utf8.decode(converted)) as List)
        .map((e) => e as String)
        .toList();
    return decodedArray;
  }

  static Diet decodeDiet({required http.Response response}) {
    try {
      final converted = utf8.decode(response.bodyBytes);
      final json = jsonDecode(converted.toString()) as Map<String, dynamic>;
      final diet = Diet.fromJson(json);

      return diet;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
