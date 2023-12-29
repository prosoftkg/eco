import 'package:eco_kg/core/error_journal/error_journal.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/paymentInfoEntity.dart';

abstract interface class IPaymentDataSource {
  Future<PaymentEntity> payment(PaymentInfoEntity paymentInfoEntity);
}

@injectable
class PaymentDataSource implements IPaymentDataSource {
  final storage = const FlutterSecureStorage();

  @override
  Future<PaymentEntity> payment(PaymentInfoEntity paymentInfoEntity) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/freedom/pay',
    );

    final String? authKey = await storage.read(key: 'authKey');
    final String? email = await storage.read(key: 'email');
    final String? phone = await storage.read(key: 'phone');
    final String? fullName = await storage.read(key: 'fullName');
    print('server $authKey');

    /*var json = {
      'test_id': paymentInfoEntity.testId,
      'type': paymentInfoEntity.paymentType,
      'name': fullName,
      'email': email,
      'phone': phone
    };*/

    var json = {
      'test_id': paymentInfoEntity.testId,
      'type': paymentInfoEntity.paymentType,
      'name': fullName,
      'email': email,
      'phone': phone,
      'sum' : paymentInfoEntity.sum
    };
    print(json);

    var response = await http
        .post(uri, body: json, headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return PaymentEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }
}
