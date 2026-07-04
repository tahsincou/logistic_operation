import 'package:dio/dio.dart';
import 'package:logistic_operation/features/logistics/shipment/data/models/shipement_model.dart';
import 'package:logistic_operation/features/logistics/shipment/domain/params/create_shipment.dart';
import '../../domain/entities/shipment.dart';

class ShipmentRemoteDataSource {
  final Dio dio;

  ShipmentRemoteDataSource(this.dio);

  Future<List<Shipment>> getShipments() async {
    final response = await dio.get('/shipments');

    return (response.data as List)
        .map((e) => ShipmentModel.fromJson(e))
        .toList();
  }

  Future<void> createShipment(CreateShipmentRequest request) async {
    await dio.post(
      '/shipments',
      data: {
        'customer': request.customer,
        'phone': request.phone,
        'address': request.address,
      },
    );
  }

  Future<void> updateShipment(Shipment shipment) async {
    final model = ShipmentModel(
      trackingId: shipment.trackingId,
      customer: shipment.customer,
      phone: shipment.phone,
      address: shipment.address,
      status: shipment.status,
    );

    await dio.put('/shipments/${shipment.trackingId}', data: model.toJson());
  }

  Future<void> deleteShipment(String trackingId) async {
    await dio.delete('/shipments/$trackingId');
  }
}
