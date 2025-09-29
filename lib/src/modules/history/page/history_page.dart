import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../shared/metrics/app_metrics.dart';
import '../../home/components/adress_list.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();

  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        actions: [
          IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Limpar histórico',
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.items.isEmpty) {
            return const Center(child: Text('Sem histórico ainda.'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppMetrics.md),
            child: AddressList(items: controller.items.toList()),
          );
        },
      ),
    );
  }
}