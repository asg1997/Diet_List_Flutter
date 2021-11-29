import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:diet_list_flutter/Service/json_decoder_service.dart';
import 'package:diet_list_flutter/Service/network_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirebaseStorageService {

  static Future<Uri> downloadURI(String path) async {
    // В БД есть своя система адресов
    // нахожу адрес в бд
    // этот адрес перевожу в общедоступный адрес uri - этот адрес знаком всем
    // это как органы в медицине имеют в каждой стране свое русскоязычное название (путь в БД)
    // но во всем мире врачи тебя поймут, если ты назовешь его на латыни (uri)
    String uriString = await firebase_storage.FirebaseStorage.instance
        .ref(path)
        .getDownloadURL();
    return Uri.parse(uriString);
  }

}
