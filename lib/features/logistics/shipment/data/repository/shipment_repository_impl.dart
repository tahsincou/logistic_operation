import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_datasource.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';

import '../../domain/entities/shipment.dart';
import '../../domain/repository/shipment_repository.dart';
import '../mock/mock_shipments.dart';

class ShipmentRepositoryImpl implements ShipmentRepository {
  ShipmentRepositoryImpl(this.localDataSource);

  final ShipmentLocalDataSource localDataSource;
  @override
  Future<List<Shipment>> getRecentShipments() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return localDataSource.getShipments();
  }

  @override
  Future<void> createShipment(CreateShipmentRequest request) async {
    final shipment = Shipment(
      trackingId: 'TRK-${DateTime.now().millisecondsSinceEpoch}',
      customer: request.customer,
      phone: request.phone,
      address: request.address,
      status: 'Pending',
    );

    await localDataSource.addShipment(shipment);
  }

  @override
  Future<void> updateShipment(Shipment shipment) {
    return localDataSource.updateShipment(shipment);
  }
}
