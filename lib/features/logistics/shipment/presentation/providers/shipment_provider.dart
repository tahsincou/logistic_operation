import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_datasource.dart';
import 'package:logistic_operation/features/logistics/shipment/data/repository/shipment_repository_impl.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/create_shipment_usecase.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/get_recent_shipment_usecase.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/update_shipment_usecase.dart';

import '../../domain/repository/shipment_repository.dart';

final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
  return ShipmentRepositoryImpl(ref.read(shipmentLocalDataSourceProvider));
});

final getRecentShipmentsUseCaseProvider = Provider<GetRecentShipmentsUseCase>((
  ref,
) {
  return GetRecentShipmentsUseCase(ref.read(shipmentRepositoryProvider));
});

final createShipmentUseCaseProvider = Provider<CreateShipmentUseCase>((ref) {
  return CreateShipmentUseCase(ref.read(shipmentRepositoryProvider));
});

final shipmentLocalDataSourceProvider = Provider<ShipmentLocalDataSource>((
  ref,
) {
  return ShipmentLocalDataSource();
});

final updateShipmentUseCaseProvider = Provider<UpdateShipmentUseCase>((ref) {
  return UpdateShipmentUseCase(ref.read(shipmentRepositoryProvider));
});
