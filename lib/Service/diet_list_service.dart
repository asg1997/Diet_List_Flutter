import 'package:diet_list_flutter/Service/firebase_storage_service.dart';
import 'package:diet_list_flutter/Service/json_decoder_service.dart';
import 'package:diet_list_flutter/Service/network_service.dart';

class DietListService {

  static Future<List<String>> getDietsList() async {
    // Получить ссылку на список с диетами
    final uri = await FirebaseStorageService.downloadURI('diets_flutter/diets_list.json');
    // Получить по ссылке объект
    final response = await NetworkService.getResponse(uri: uri);
    // Декодировать
    JsonDecoderService.decodeDietList(response: response);

    return JsonDecoderService.decodeDietList(response: response);
  }
}