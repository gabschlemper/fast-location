// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_HomeController.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$resultsAtom =
      Atom(name: '_HomeController.results', context: context);

  @override
  ObservableList<AddressModel> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableList<AddressModel> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  late final _$lastAddressAtom =
      Atom(name: '_HomeController.lastAddress', context: context);

  @override
  AddressModel? get lastAddress {
    _$lastAddressAtom.reportRead();
    return super.lastAddress;
  }

  @override
  set lastAddress(AddressModel? value) {
    _$lastAddressAtom.reportWrite(value, super.lastAddress, () {
      super.lastAddress = value;
    });
  }

  late final _$modeAtom = Atom(name: '_HomeController.mode', context: context);

  @override
  SearchMode get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(SearchMode value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  late final _$cepAtom = Atom(name: '_HomeController.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$ufAtom = Atom(name: '_HomeController.uf', context: context);

  @override
  String get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  late final _$cityAtom = Atom(name: '_HomeController.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$streetAtom =
      Atom(name: '_HomeController.street', context: context);

  @override
  String get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$loadLastAsyncAction =
      AsyncAction('_HomeController.loadLast', context: context);

  @override
  Future<void> loadLast() {
    return _$loadLastAsyncAction.run(() => super.loadLast());
  }

  late final _$searchByCepAsyncAction =
      AsyncAction('_HomeController.searchByCep', context: context);

  @override
  Future<void> searchByCep() {
    return _$searchByCepAsyncAction.run(() => super.searchByCep());
  }

  late final _$searchByAddressAsyncAction =
      AsyncAction('_HomeController.searchByAddress', context: context);

  @override
  Future<void> searchByAddress() {
    return _$searchByAddressAsyncAction.run(() => super.searchByAddress());
  }

  late final _$openRouteToLastAsyncAction =
      AsyncAction('_HomeController.openRouteToLast', context: context);

  @override
  Future<void> openRouteToLast() {
    return _$openRouteToLastAsyncAction.run(() => super.openRouteToLast());
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void setMode(SearchMode value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setMode');
    try {
      return super.setMode(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUf(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
results: ${results},
lastAddress: ${lastAddress},
mode: ${mode},
cep: ${cep},
uf: ${uf},
city: ${city},
street: ${street}
    ''';
  }
}
