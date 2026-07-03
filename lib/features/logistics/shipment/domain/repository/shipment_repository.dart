import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';

import '../entities/shipment.dart';

abstract interface class ShipmentRepository {
  Future<List<Shipment>> getRecentShipments();

  Future<void> createShipment(CreateShipmentRequest request);

  Future<void> updateShipment(Shipment shipment);
}
