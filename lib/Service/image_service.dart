
import 'firebase_storage_service.dart';

class ImageService {
  // найти файл по фильтру и вернуть объект
  static Future<String> getImage({required String path}) async {
    print('Путь к картинке: ${path}');
    // сформировать ссылку на бд
    final Uri uri = await FirebaseStorageService.downloadURI('images/${path}');
    // сформировать ответ
    return uri.toString();

  }
}