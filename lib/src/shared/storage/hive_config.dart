import 'package:hive_flutter/hive_flutter.dart';
import '../../modules/home/model/adress_model.dart';

class HiveConfig {
  static const historyBoxName = 'history';

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(AddressModelAdapter().typeId)) {
      Hive.registerAdapter(AddressModelAdapter());
    }
    await Hive.openBox<AddressModel>(historyBoxName);
  }

  static Box<AddressModel> get historyBox => Hive.box<AddressModel>(historyBoxName);
}