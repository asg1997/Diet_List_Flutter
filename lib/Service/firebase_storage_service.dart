import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirebaseStorageService {

  // Сервис, который обрабатывает http запросы по uri (слить со следующим?)
  // Сервис, получающий данные из firebase (причем желательно, чтобы его можно было заменить)
  // Сервис, который

// TODO: - Изменить название и структуру
// TODO: - Нужен httpService
// Еще нужно подумать - Firebase быстро развиваются и методы будут меняться
// как-то нужно оградить, чтобы это в целом не повлияло на струкутуру сильно
// То есть нужен сервис получения данных и не так важно, откуда
  static Future<List<String>> downloadDietsList() async {
    // Получить ссылку на список с диетами
    final uri = await _downloadURI('diets_flutter/diets_list.json');
    // Получить по ссылке объект
    http.Response response = await http.get(uri);
    return  _decodeCyrillicJSON(response);
  }

  static Future<Uri> _downloadURI (String path) async {
    // В БД есть своя система адресов
    // нахожу адрес в бд
    // этот адрес перевожу в общедоступный адрес uri - этот адрес знаком всем
    // это как органы в медицине имеют в каждой стране свое русскоязычное название (путь в БД)
    // но во всем мире врачи тебя поймут, если ты назовешь его на латыни (uri)
    String uriString = await firebase_storage.FirebaseStorage.instance.ref(path).getDownloadURL();
    return Uri.parse(uriString);
  }

  static List<String> _decodeCyrillicJSON(http.Response response) {
    // К нам пришло содержимое, но оно отобрадается некорректно,
    // потому что там есть киррилические символы.
    // Чтобы поправить ситуацию, мы конвертируем полученный ответ в байты
    final converted = response.bodyBytes;
    // А потом из байтов уже конвертируем в формат UTF8
    // И из этого формата конвертируем json
    final List<String> decodedArray = jsonDecode(utf8.decode(converted));
    return decodedArray;
  }


}