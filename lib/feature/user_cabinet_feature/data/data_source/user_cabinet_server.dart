import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userData.dart';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

abstract interface class IUserCabinetDataSource {
  Future<bool> editUserData(UserDataForEdit userDataForEdit);
}

@injectable
class UserCabinetDataSource implements IUserCabinetDataSource {
  final storage = const FlutterSecureStorage();
  @override
  Future<bool> editUserData(UserDataForEdit userDataForEdit) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: 'api/user/edit-account',
    );

    final String? authKey = await storage.read(key: 'authKey');
    print('server $authKey');

    var json={
      'phone' : userDataForEdit.phone,
      'full_name' : userDataForEdit.name,
    };
    print(json);

    var response = await http.post(uri,body: json,headers: {'Authorization': 'Bearer $authKey'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return true;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw Exception(response.reasonPhrase);
    }
  }

}

