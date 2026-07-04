import 'package:logistic_operation/core/common/repository_result.dart';
import 'package:logistic_operation/core/network/network_exception.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_data_source.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_remote_datasource.dart';
import 'package:logistic_operation/features/logistics/shipment/data/models/shipement_model.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/entities/shipment_details.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';

import '../../domain/entities/shipment.dart';
import '../../domain/repository/shipment_repository.dart';

class ShipmentRepositoryImpl implements ShipmentRepository {
  ShipmentRepositoryImpl({required this.remote, required this.local});

  final ShipmentRemoteDataSource remote;
  final ShipmentLocalDataSource local;

  @override
  Future<RepositoryResult<List<Shipment>>> getRecentShipments() async {
    try {
      final shipments = await remote.getShipments();

      await local.replaceShipments(shipments);

      return RepositoryResult(data: shipments, isFromCache: false);
    } on NetworkException {
      return RepositoryResult(
        data: await local.getShipments(),
        isFromCache: true,
      );
    }
  }

  @override
  Future<void> createShipment(CreateShipmentRequest request) {
    return remote.createShipment(request);
  }

  @override
  Future<void> updateShipment(Shipment shipment) {
    return remote.updateShipment(shipment);
  }

  @override
  Future<void> deleteShipment(String trackingId) {
    return remote.deleteShipment(trackingId);
  }

  @override
  Future<ShipmentDetails> getShipmentDetails(String trackingId) {
    return remote.getShipmentDetails(trackingId);
  }
}
