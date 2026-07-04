import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_datasource.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';

import '../../domain/entities/shipment.dart';
import '../../domain/repository/shipment_repository.dart';

class ShipmentRepositoryImpl implements ShipmentRepository {
  ShipmentRepositoryImpl({required this.remoteDataSource});

  final ShipmentRemoteDataSource remoteDataSource;

  @override
  Future<List<Shipment>> getRecentShipments() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return remoteDataSource.getShipments();
  }

  @override
  Future<void> createShipment(CreateShipmentRequest request) async {
    await remoteDataSource.createShipment(request);
  }

  @override
  Future<void> updateShipment(Shipment shipment) {
    return remoteDataSource.updateShipment(shipment);
  }

  @override
  Future<void> deleteShipment(String trackingId) {
    return remoteDataSource.deleteShipment(trackingId);
  }
}
