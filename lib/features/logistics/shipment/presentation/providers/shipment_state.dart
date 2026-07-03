import 'package:logistic_operation/features/logistics/shipment/domain/entities/shipment.dart';

class ShipmentState {
  final bool isLoading;
  final bool isSubmitting;
  final List<Shipment> shipments;
  final String? error;

  const ShipmentState({
    this.isLoading = false,
    this.isSubmitting = false,
    this.shipments = const [],
    this.error,
  });

  ShipmentState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    List<Shipment>? shipments,
    String? error,
  }) {
    return ShipmentState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      shipments: shipments ?? this.shipments,
      error: error,
    );
  }
}
