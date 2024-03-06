import 'dart:convert';
import 'package:eco_kg/core/error_journal/error_journal.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_certificate_entity.dart';
import 'package:eco_kg/feature/story_feature/domain/entities/user_story_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/audit_story_entity.dart';

abstract interface class IStoryDataSource {
  Future<AuditStoryEntity> auditStory();
}

@injectable
class StoryDataSource implements IStoryDataSource {
  final storage = const FlutterSecureStorage();
  @override
  Future<AuditStoryEntity> auditStory() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/history',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');
    var response = await http.get(uri,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return AuditStoryEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error:response.reasonPhrase!);
    }
  }

  @override
  Future<UserHistoryEntity> userStory() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/user-history',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');
    var response = await http.get(uri,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return UserHistoryEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error:response.reasonPhrase!);
    }
  }

  Future<String> downloadUserStory(String testId) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/test/generate-pdf',
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
      'test_id': testId,
    };
    print(json);

    var response = await http
        .post(uri, body: json, headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  @override
  Future<List<UserCertificate>> userCertificate() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/cert-list',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');
    var response = await http.get(uri,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      List<UserCertificate> userCertificate=[];
      for(var item in jsonDecode(response.body)){
        userCertificate.add(UserCertificate.fromJson(item));
      }
      return userCertificate;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error:response.reasonPhrase!);
    }
  }
}
