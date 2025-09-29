import 'package:flutter/material.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/metrics/app_metrics.dart';
import '../model/adress_model.dart';

class LastAddressCard extends StatelessWidget {
  final AddressModel? address;
  final VoidCallback onRoute;

  const LastAddressCard({Key? key, required this.address, required this.onRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (address == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppMetrics.md),
          child: const Text('Nenhum endereço consultado ainda.'),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppMetrics.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Último endereço consultado', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: AppMetrics.sm),
            Text(address!.fullAddress),
            const SizedBox(height: AppMetrics.sm),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed: onRoute,
                icon: const Icon(Icons.directions),
                label: const Text('Traçar rota'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}