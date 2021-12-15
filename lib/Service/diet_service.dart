import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:diet_list_flutter/Service/firebase_storage_service.dart';

import 'json_decoder_service.dart';
import 'network_service.dart';

class DietService {
  // найти файл по фильтру и вернуть объект
  static Future<Diet> getDiet({required String named}) async {

    // сформировать ссылку на бд
    final Uri uri = await FirebaseStorageService.downloadURI('diets_flutter/$named.json');
    // сформировать ответ
    final response = await NetworkService.getResponse(uri: uri);
    final Diet diet = JsonDecoderService.decodeDiet(response: response);
    return diet;

  }
}
