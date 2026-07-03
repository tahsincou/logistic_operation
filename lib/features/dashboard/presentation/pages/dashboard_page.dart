import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_operation/features/auth/presentaion/providers/auth_notifier.dart';
import 'package:logistic_operation/features/dashboard/presentation/providers/dashboard_notifier.dart';
import 'package:logistic_operation/features/logistics/shipment/presentation/providers/shipment_notifier.dart';
import 'package:logistic_operation/shared/widgets/dashboard_card.dart';
import 'package:logistic_operation/shared/widgets/shipment_tile.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(dashboardNotifierProvider.notifier).loadSummary();
      ref.read(shipmentNotifierProvider.notifier).loadShipments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);
    final shipmentState = ref.watch(shipmentNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();

              if (context.mounted) {
                context.go('/login');
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today\'s Overview',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.6,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DashboardCard(
                        title: 'Deliveries',
                        value: state.summary?.deliveries.toString() ?? '0',
                      ),
                      DashboardCard(
                        title: 'Pending',
                        value: state.summary?.pending.toString() ?? '0',
                      ),
                      DashboardCard(
                        title: 'Completed',
                        value: state.summary?.completed.toString() ?? '0',
                      ),
                      DashboardCard(
                        title: 'Failed',
                        value: state.summary?.failed.toString() ?? '0',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Recent Shipments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: ListView.builder(
                      itemCount: shipmentState.shipments.length,
                      itemBuilder: (context, index) {
                        final shipment = shipmentState.shipments[index];
                        return ShipmentTile(
                          shipment: shipment,
                          onTap: () {
                            context.push('/shipment-details', extra: shipment);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final created = await context.push<bool>('/create-shipment');

          if (created == true && mounted) {
            ref.read(shipmentNotifierProvider.notifier).loadShipments();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
