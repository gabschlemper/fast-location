import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';
import '../model/adress_model.dart';
import '../repositories/history_repository.dart';
import '../repositories/viacep_repository.dart';

class AddressService {
  AddressService({
    ViaCepRepository? viaCepRepository,
    HistoryRepository? historyRepository,
  })  : _viaCepRepository = viaCepRepository ?? ViaCepRepository(),
        _historyRepository = historyRepository ?? HistoryRepository();

  final ViaCepRepository _viaCepRepository;
  final HistoryRepository _historyRepository;

  Future<AddressModel> searchByCep(String cep) async {
    final result = await _viaCepRepository.getByCep(cep);
    await _historyRepository.add(result);
    return result;
  }

  Future<List<AddressModel>> searchByAddress({
    required String uf,
    required String city,
    required String street,
  }) async {
    final results = await _viaCepRepository.getByAddress(uf: uf, city: city, street: street);
    if (results.isNotEmpty) {
      // Armazena o primeiro como "principal" no histórico
      await _historyRepository.add(results.first);
    }
    return results;
  }

  List<AddressModel> getHistory() => _historyRepository.getHistory();
  AddressModel? getLast() => _historyRepository.getLast();
  Future<void> clearHistory() => _historyRepository.clear();

  Future<void> openRouteTo(AddressModel address) async {
    final query = address.fullAddress;
    final locations = await locationFromAddress(query);
    if (locations.isEmpty) {
      throw Exception('Não foi possível geocodificar o endereço.');
    }
    final dest = Coords(locations.first.latitude, locations.first.longitude);

    final availableMaps = await MapLauncher.installedMaps;
    if (availableMaps.isEmpty) {
      throw Exception('Nenhum app de mapas instalado.');
    }

    // Usa o primeiro app disponível
    final map = availableMaps.first;
    await map.showDirections(
      destination: dest,
      destinationTitle: address.fullAddress,
      // origem não informada: o app usará a localização atual do dispositivo
    );
  }
}