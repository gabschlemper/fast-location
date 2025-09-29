import 'package:mobx/mobx.dart';
import '../model/adress_model.dart';
import '../service/adress_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with Store;

enum SearchMode { cep, address }

abstract class _HomeController with Store {
  _HomeController({AddressService? service}) : _service = service ?? AddressService() {
    results = ObservableList<AddressModel>();
  }

  final AddressService _service;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableList<AddressModel> results = ObservableList<AddressModel>();

  @observable
  AddressModel? lastAddress;

  @observable
  SearchMode mode = SearchMode.cep;

  // Inputs
  @observable
  String cep = '';

  @observable
  String uf = '';

  @observable
  String city = '';

  @observable
  String street = '';

  @action
  void setMode(SearchMode value) => mode = value;

  @action
  void setCep(String value) => cep = value;

  @action
  void setUf(String value) => uf = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setStreet(String value) => street = value;

  @action
  Future<void> loadLast() async {
    lastAddress = _service.getLast();
  }

  @action
  Future<void> searchByCep() async {
    isLoading = true;
    error = null;
    results.clear();
    try {
      final addr = await _service.searchByCep(cep);
      lastAddress = addr;
      results.add(addr);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> searchByAddress() async {
    isLoading = true;
    error = null;
    results.clear();
    try {
      final list = await _service.searchByAddress(uf: uf, city: city, street: street);
      if (list.isEmpty) {
        error = 'Nenhum resultado encontrado.';
      } else {
        results.addAll(list);
        lastAddress = list.first;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> openRouteToLast() async {
    if (lastAddress == null) {
      error = 'Nenhum endereço consultado ainda.';
      return;
    }
    try {
      await _service.openRouteTo(lastAddress!);
    } catch (e) {
      error = e.toString();
    }
  }
}