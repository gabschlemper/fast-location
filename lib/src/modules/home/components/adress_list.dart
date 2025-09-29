import 'package:flutter/material.dart';
import '../../../shared/metrics/app_metrics.dart';
import '../model/adress_model.dart';

class AddressList extends StatelessWidget {
  final List<AddressModel> items;
  const AddressList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        final a = items[i];
        return ListTile(
          leading: const Icon(Icons.home_outlined),
          title: Text(a.logradouro.isNotEmpty ? a.logradouro : a.cep),
          subtitle: Text('${a.bairro.isNotEmpty ? '${a.bairro}, ' : ''}${a.localidade} - ${a.uf}\nCEP: ${a.cep}'),
          isThreeLine: true,
        );
      },
    );
  }
}