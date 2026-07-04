import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistic_operation/core/providers/database_provider.dart';
import 'package:logistic_operation/core/providers/network_provider.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_data_source.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_local_data_source_impl.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_memory_data_source.dart';
import 'package:logistic_operation/features/logistics/shipment/data/datasources/shipment_remote_datasource.dart';
import 'package:logistic_operation/features/logistics/shipment/data/repository/shipment_repository_impl.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/create_shipment_usecase.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/delete_shipment_usecase.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/get_recent_shipment_usecase.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/usecases/update_shipment_usecase.dart';

import '../../domain/repository/shipment_repository.dart';

final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
  return ShipmentRepositoryImpl(
    remote: ref.read(shipmentRemoteDataSourceProvider),
    local: ref.read(shipmentLocalDataSourceProvider),
  );
});

final getRecentShipmentsUseCaseProvider = Provider<GetRecentShipmentsUseCase>((
  ref,
) {
  return GetRecentShipmentsUseCase(ref.read(shipmentRepositoryProvider));
});

final createShipmentUseCaseProvider = Provider<CreateShipmentUseCase>((ref) {
  return CreateShipmentUseCase(ref.read(shipmentRepositoryProvider));
});

final shipmentRemoteDataSourceProvider = Provider<ShipmentRemoteDataSource>((
  ref,
) {
  return ShipmentRemoteDataSource(ref.read(apiClientProvider));
});

final updateShipmentUseCaseProvider = Provider<UpdateShipmentUseCase>((ref) {
  return UpdateShipmentUseCase(ref.read(shipmentRepositoryProvider));
});

final deleteShipmentUseCaseProvider = Provider<DeleteShipmentUseCase>((ref) {
  return DeleteShipmentUseCase(ref.read(shipmentRepositoryProvider));
});

final shipmentLocalDataSourceProvider = Provider<ShipmentLocalDataSource>((
  ref,
) {
  if (kIsWeb) {
    return ShipmentInMemoryDataSource();
  }

  return ShipmentLocalDataSourceImpl(ref.read(databaseProvider));
});
