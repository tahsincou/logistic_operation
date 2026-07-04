import 'package:flutter_riverpod/legacy.dart';
import 'package:logistic_operation/features/logistics/shipment/presentation/notifiers/shipment_details/shipment_details_notifier.dart';
import 'package:logistic_operation/features/logistics/shipment/presentation/notifiers/shipment_details/shipment_details_state.dart';
import 'package:logistic_operation/features/logistics/shipment/presentation/providers/shipment_provider.dart';

final shipmentDetailsNotifierProvider =
    StateNotifierProvider<ShipmentDetailsNotifier, ShipmentDetailsState>((ref) {
      return ShipmentDetailsNotifier(ref.read(shipmentRepositoryProvider));
    });
