import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_operation/shared/widgets/info_tile.dart';

import '../../domain/entities/shipment.dart';

class ShipmentDetailsPage extends StatelessWidget {
  final Shipment shipment;

  const ShipmentDetailsPage({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shipment Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.qr_code_2),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tracking ID',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            shipment.trackingId,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            InfoTile(
              icon: Icons.person,
              title: 'Customer',
              value: shipment.customer,
            ),

            InfoTile(icon: Icons.phone, title: 'Phone', value: shipment.phone),

            InfoTile(
              icon: Icons.location_on,
              title: 'Address',
              value: shipment.address,
            ),

            InfoTile(
              icon: Icons.local_shipping,
              title: 'Status',
              value: shipment.status,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () async {
          final updated = await context.push<bool>(
            '/edit-shipment',
            extra: shipment,
          );

          if (updated == true && context.mounted) {
            context.pop(true);
          }
        },
      ),
    );
  }
}
