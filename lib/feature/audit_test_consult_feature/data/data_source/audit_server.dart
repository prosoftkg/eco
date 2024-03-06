import 'dart:convert';
import 'package:eco_kg/core/error_journal/error_journal.dart';
import 'package:eco_kg/feature/audit_test_consult_feature/domain/entities/audit_consult_list_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/audit_test_list_entity.dart';

abstract interface class IAuditDataSource {
  Future<List<AuditTest>> auditTestList();
}

@injectable
class AuditDataSource implements IAuditDataSource {
  final storage = const FlutterSecureStorage();
  @override
  Future<List<AuditTest>> auditTestList() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/list',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var response = await http.get(uri,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      List<AuditTest> auditTest = [];
      final jsonData = jsonDecode(response.body);
      for (var auditTestItem in jsonData) {
        auditTest.add(AuditTest.fromJson(auditTestItem));
      }
      print('here');
      return auditTest;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  @override
  Future<List<AuditConsult>> auditConsultList() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/consult-list',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var response = await http.get(uri,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      List<AuditConsult> auditConsult = [];
      final jsonData = jsonDecode(response.body);
      for (var auditConsultItem in jsonData) {
        auditConsult.add(AuditConsult.fromJson(auditConsultItem));
      }
      print('here');
      return auditConsult;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  Future<bool> denyAuditTestList(String testId) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/deny-test',
    );



    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var json={
      'test_id': testId
    };

    var response = await http.post(uri,body:json,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      final jsonData = jsonDecode(response.body);
      return jsonData['result'];
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  Future<bool> acceptAuditTestList(String testId) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/accept-test',
    );



    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var json={
      'test_id': testId
    };

    var response = await http.post(uri,body:json,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      final jsonData = jsonDecode(response.body);
      return jsonData['result'];
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  Future<bool> denyAuditConsultList(String consultId) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/deny-consultation',
    );



    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var json={
      'consultation_id': consultId
    };

    var response = await http.post(uri,body:json,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      final jsonData = jsonDecode(response.body);
      return jsonData['result'];
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  Future<bool> confirmAuditConsultList(String testId) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/consultation-confirm',
    );

    print('api/user/consultation-confirm');
    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var json={
      'consultation_id': testId
    };

    var response = await http.post(uri,body:json,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      final jsonData = jsonDecode(response.body);
      return jsonData['result'];
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error:response.reasonPhrase ?? 'Вышла ошибка');
    }
  }
}
