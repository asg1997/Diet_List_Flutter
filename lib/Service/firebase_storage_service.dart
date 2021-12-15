import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
