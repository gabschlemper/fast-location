import 'package:hive/hive.dart';
import '../../../shared/storage/hive_config.dart';
import '../model/adress_model.dart';

class HistoryRepository {
  Box<AddressModel> get _box => HiveConfig.historyBox;

  List<AddressModel> getHistory() {
    // Armazenamos cada item por chave incremental
    return _box.values.toList().reversed.toList(); // mais recente primeiro
  }

  Future<void> add(AddressModel address) async {
    await _box.add(address);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  AddressModel? getLast() {
    if (_box.isEmpty) return null;
    return _box.getAt(_box.length - 1);
  }
}