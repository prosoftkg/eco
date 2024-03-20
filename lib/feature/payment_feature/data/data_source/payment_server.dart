import 'package:eco_kg/core/error_journal/error_journal.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/getCertificateInfoEntity.dart';
import 'package:eco_kg/feature/payment_feature/domain/entities/payment_entity.dart';
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
      'company_director': paymentInfoEntity.companyDirector,
      'email': email,
      'phone': '996${
          paymentInfoEntity.phone
              .replaceAll(' ', '')
              .replaceAll('(', '')
              .replaceAll(')', '')
              .replaceAll('-', '').replaceFirst('0', '')
      }',
      'sum' : paymentInfoEntity.sum,
      'company_name' : paymentInfoEntity.companyName,
      'company_area' : paymentInfoEntity.area,
      'region' : paymentInfoEntity.region
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

  @override
  Future<bool> getCertificate(GetCertificateInfoEntity getCertificateInfoEntity) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/get-cert',
    );

    final String? authKey = await storage.read(key: 'authKey');
    final String? email = await storage.read(key: 'email');
    print('server $authKey');

    /*var json = {
      'test_id': paymentInfoEntity.testId,
      'type': paymentInfoEntity.paymentType,
      'name': fullName,
      'email': email,
      'phone': phone
    };*/

    var json = {
      'test_id': getCertificateInfoEntity.testId,
      'company_name' : getCertificateInfoEntity.companyName,
      'type': getCertificateInfoEntity.paymentType,
      'company_director': getCertificateInfoEntity.companyDirector,
      'region' : getCertificateInfoEntity.region,
      'category_id' : getCertificateInfoEntity.categoryId,
      'company_area' : getCertificateInfoEntity.area,
      'phone': '996${
          getCertificateInfoEntity.phone
              .replaceAll(' ', '')
              .replaceAll('(', '')
              .replaceAll(')', '')
              .replaceAll('-', '').replaceFirst('0', '')
      }',
      'business_type': getCertificateInfoEntity.businessType,
      'business_duration' : getCertificateInfoEntity.businessDuration,
      'staff_amount' : getCertificateInfoEntity.staffAmount,
      'extra_information' : getCertificateInfoEntity.textCompany
    };
    print(json);

    var response = await http
        .post(uri, body: json, headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return true;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  @override
  Future<bool> getConsultation(GetCertificateInfoEntity getCertificateInfoEntity) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/consultation-appoint',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    /*var json = {
      'test_id': paymentInfoEntity.testId,
      'type': paymentInfoEntity.paymentType,
      'name': fullName,
      'email': email,
      'phone': phone
    };*/

    var json = {
      'company_name' : getCertificateInfoEntity.companyName,
      'company_director': getCertificateInfoEntity.companyDirector,
      'region' : getCertificateInfoEntity.region,
      'company_area' : getCertificateInfoEntity.area,
      'phone': '996${
          getCertificateInfoEntity.phone
              .replaceAll(' ', '')
              .replaceAll('(', '')
              .replaceAll(')', '')
              .replaceAll('-', '').replaceFirst('0', '')
      }',
      'business_type': getCertificateInfoEntity.businessType,
      'business_duration' : getCertificateInfoEntity.businessDuration,
      'staff_amount' : getCertificateInfoEntity.staffAmount,
      'extra_information' : getCertificateInfoEntity.textCompany
    };
    print(json);

    var response = await http
        .post(uri, body: json, headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return true;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }
}