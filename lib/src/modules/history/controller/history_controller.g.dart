// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HistoryController.isLoading', context: context);

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

  late final _$itemsAtom =
      Atom(name: '_HistoryController.items', context: context);

  @override
  ObservableList<AddressModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<AddressModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_HistoryController.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$clearAsyncAction =
      AsyncAction('_HistoryController.clear', context: context);

  @override
  Future<void> clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
items: ${items}
    ''';
  }
}
