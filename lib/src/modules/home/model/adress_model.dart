import 'package:hive/hive.dart';
part 'adress_model.g.dart';

@HiveType(typeId: 0)
class AddressModel {
  @HiveField(0)
  final String cep;
  @HiveField(1)
  final String logradouro;
  @HiveField(2)
  final String complemento;
  @HiveField(3)
  final String bairro;
  @HiveField(4)
  final String localidade;
  @HiveField(5)
  final String uf;
  @HiveField(6)
  final String ddd;

  AddressModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  String get fullAddress {
    final parts = [
      if (logradouro.isNotEmpty) logradouro,
      if (bairro.isNotEmpty) bairro,
      if (localidade.isNotEmpty && uf.isNotEmpty) '$localidade - $uf',
      if (cep.isNotEmpty) cep,
    ];
    return parts.join(', ');
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: (json['cep'] ?? '').toString(),
      logradouro: (json['logradouro'] ?? '').toString(),
      complemento: (json['complemento'] ?? '').toString(),
      bairro: (json['bairro'] ?? '').toString(),
      localidade: (json['localidade'] ?? '').toString(),
      uf: (json['uf'] ?? '').toString(),
      ddd: (json['ddd'] ?? '').toString(),
    );
  }
}