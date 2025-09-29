import 'package:mobx/mobx.dart';
import '../../home/model/adress_model.dart';
import '../../home/service/adress_service.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryController with Store;

abstract class _HistoryController with Store {
  _HistoryController({AddressService? service}) : _service = service ?? AddressService() {
    items = ObservableList<AddressModel>();
  }

  final AddressService _service;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<AddressModel> items = ObservableList<AddressModel>();

  @action
  Future<void> load() async {
    isLoading = true;
    items.clear();
    final data = _service.getHistory();
    items.addAll(data);
    isLoading = false;
  }

  @action
  Future<void> clear() async {
    await _service.clearHistory();
    await load();
  }
}