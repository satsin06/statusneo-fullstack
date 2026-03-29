import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String petBox = 'pet_box';
  static const String petProfileKey = 'pet_profile';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(petBox);
  }

  static Box getPetBox() => Hive.box(petBox);
}