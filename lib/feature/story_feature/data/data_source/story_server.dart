import 'dart:convert';
import 'package:eco_kg/core/error_journal/error_journal.dart';
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
}
