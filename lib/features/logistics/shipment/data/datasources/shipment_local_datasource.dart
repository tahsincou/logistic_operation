import '../../domain/entities/shipment.dart';

class ShipmentLocalDataSource {
  ShipmentLocalDataSource() {
    _shipments.addAll([
      const Shipment(
        trackingId: 'TRK-1001',
        customer: 'John Doe',
        phone: '+1 555 123 456',
        address: '221B Baker Street, London',
        status: 'Delivered',
      ),
      const Shipment(
        trackingId: 'TRK-1002',
        customer: 'Alice Smith',
        phone: '+1 555 987 654',
        address: '742 Evergreen Terrace',
        status: 'Pending',
      ),
      const Shipment(
        trackingId: 'TRK-1003',
        customer: 'David Brown',
        phone: '+1 555 456 789',
        address: '1600 Pennsylvania Ave',
        status: 'Failed',
      ),
    ]);
  }

  final List<Shipment> _shipments = [];

  Future<List<Shipment>> getShipments() async {
    return List.from(_shipments);
  }

  Future<void> addShipment(Shipment shipment) async {
    _shipments.insert(0, shipment);
  }

  Future<void> updateShipment(Shipment shipment) async {
    final index = _shipments.indexWhere(
      (e) => e.trackingId == shipment.trackingId,
    );

    if (index != -1) {
      _shipments[index] = shipment;
    }
  }
}
