import 'package:dio/dio.dart';
import 'package:logistic_operation/core/network/api_client.dart';
import 'package:logistic_operation/core/network/dio_exception_mapper.dart';
import 'package:logistic_operation/features/logistics/shipment/data/models/shipement_model.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';
import '../../domain/entities/shipment.dart';

class ShipmentRemoteDataSource {
  final ApiClient apiClient;

  ShipmentRemoteDataSource(this.apiClient);

  Future<List<Shipment>> getShipments() async {
    try {
      final response = await apiClient.get<List>('/shipments');

      return (response.data as List)
          .map((e) => ShipmentModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<void> createShipment(CreateShipmentRequest request) async {
    try {
      await apiClient.post(
        '/shipments',
        data: {
          'customer': request.customer,
          'phone': request.phone,
          'address': request.address,
        },
      );
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<void> updateShipment(Shipment shipment) async {
    final model = ShipmentModel(
      trackingId: shipment.trackingId,
      customer: shipment.customer,
      phone: shipment.phone,
      address: shipment.address,
      status: shipment.status,
    );

    try {
      await apiClient.put(
        '/shipments/${shipment.trackingId}',
        data: model.toJson(),
      );
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }

  Future<void> deleteShipment(String trackingId) async {
    try {
      await apiClient.delete('/shipments/$trackingId');
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }
}
