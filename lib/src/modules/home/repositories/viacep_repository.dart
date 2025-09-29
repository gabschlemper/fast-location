import 'package:dio/dio.dart';
import '../../../http/dio_client.dart';
import '../model/adress_model.dart';

class ViaCepRepository {
  final Dio _dio = DioClient.instance.dio;

  Future<AddressModel> getByCep(String cep) async {
    final sanitized = cep.replaceAll(RegExp(r'[^0-9]'), '');
    final response = await _dio.get('/ws/$sanitized/json/');
    final data = response.data;
    if (data is Map && data['erro'] == true) {
      throw Exception('CEP não encontrado');
    }
    return AddressModel.fromJson(Map<String, dynamic>.from(data));
  }

  Future<List<AddressModel>> getByAddress({
    required String uf,
    required String city,
    required String street,
  }) async {
    final path = '/ws/${uf.trim()}/${city.trim()}/${street.trim()}/json/';
    final response = await _dio.get(path);
    final data = response.data;
    if (data is List) {
      return data.map((e) => AddressModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else if (data is Map && data['erro'] == true) {
      return [];
    }
    return [];
  }
}