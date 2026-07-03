import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/entities/shipment.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';

import 'shipment_provider.dart';
import 'shipment_state.dart';

final shipmentNotifierProvider =
    StateNotifierProvider<ShipmentNotifier, ShipmentState>(
      (ref) => ShipmentNotifier(ref),
    );

class ShipmentNotifier extends StateNotifier<ShipmentState> {
  ShipmentNotifier(this.ref) : super(const ShipmentState());

  final Ref ref;

  Future<void> loadShipments() async {
    state = state.copyWith(isLoading: true);

    try {
      final shipments = await ref.read(getRecentShipmentsUseCaseProvider)();

      state = state.copyWith(isLoading: false, shipments: shipments);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> createShipment(CreateShipmentRequest request) async {
    state = state.copyWith(isSubmitting: true);

    try {
      await ref.read(createShipmentUseCaseProvider)(request);

      state = state.copyWith(isSubmitting: false);

      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());

      return false;
    }
  }

  Future<bool> updateShipment(Shipment shipment) async {
    state = state.copyWith(isSubmitting: true);

    try {
      await ref.read(updateShipmentUseCaseProvider)(shipment);

      state = state.copyWith(isSubmitting: false);

      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());

      return false;
    }
  }
}
