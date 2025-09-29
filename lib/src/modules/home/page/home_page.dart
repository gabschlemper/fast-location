import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../routes/app_routes.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/metrics/app_metrics.dart';
import '../components/adress_list.dart';
import '../components/empty_result.dart';
import '../components/last_adress_card.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final cepCtrl = TextEditingController();
  final ufCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final streetCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.loadLast();
  }

  @override
  void dispose() {
    cepCtrl.dispose();
    ufCtrl.dispose();
    cityCtrl.dispose();
    streetCtrl.dispose();
    super.dispose();
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: AppColors.error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FastLocation'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.history),
            icon: const Icon(Icons.history),
            tooltip: 'Histórico',
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showError(controller.error!.replaceFirst('Exception: ', ''));
              controller.error = null;
            });
          }
          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(AppMetrics.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ToggleButtons(
                      isSelected: [
                        controller.mode == SearchMode.cep,
                        controller.mode == SearchMode.address,
                      ],
                      onPressed: (i) {
                        controller.setMode(i == 0 ? SearchMode.cep : SearchMode.address);
                      },
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('CEP'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Endereço'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppMetrics.md),
                    if (controller.mode == SearchMode.cep) ...[
                      TextField(
                        controller: cepCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'CEP',
                          hintText: 'Ex.: 01001000',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: controller.setCep,
                      ),
                      const SizedBox(height: AppMetrics.sm),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: controller.searchByCep,
                          icon: const Icon(Icons.search),
                          label: const Text('Consultar CEP'),
                        ),
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: ufCtrl,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(labelText: 'UF', border: OutlineInputBorder()),
                              onChanged: controller.setUf,
                            ),
                          ),
                          const SizedBox(width: AppMetrics.sm),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: cityCtrl,
                              decoration: const InputDecoration(labelText: 'Cidade', border: OutlineInputBorder()),
                              onChanged: controller.setCity,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppMetrics.sm),
                      TextField(
                        controller: streetCtrl,
                        decoration: const InputDecoration(labelText: 'Logradouro', border: OutlineInputBorder()),
                        onChanged: controller.setStreet,
                      ),
                      const SizedBox(height: AppMetrics.sm),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: controller.searchByAddress,
                          icon: const Icon(Icons.search),
                          label: const Text('Buscar Endereço'),
                        ),
                      ),
                    ],
                    const SizedBox(height: AppMetrics.lg),
                    LastAddressCard(address: controller.lastAddress, onRoute: controller.openRouteToLast),
                    const SizedBox(height: AppMetrics.lg),
                    const Text('Resultados', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: AppMetrics.sm),
                    if (!controller.isLoading && controller.results.isEmpty)
                      const EmptyResult()
                    else
                      AddressList(items: controller.results.toList()),
                  ],
                ),
              ),
              if (controller.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}