import 'dart:convert';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/user_cabinet_feature/domain/entities/userDataForChangeLocal.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/constants/api_constants.dart';

abstract interface class IAuthSourse {
  Future<bool> signIn(String email);
  Future<bool> readAuthKey();
}

@injectable
class AuthSourse implements IAuthSourse {
  final storage = const FlutterSecureStorage();

  Future<bool> signIn(String email) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: '$mainPath/register',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = email;
    var sendRequest = await request.send();
    var response = await http.Response.fromStream(sendRequest);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['success'];
    } else {
      print('error');
      print(response.statusCode);
      print(response.request);
      return false;
    }
  }

  @override
  Future<bool> readAuthKey() async {
    final String? password = await storage.read(key: 'authKey');
    if(password!=null){
      UserData.userRole=await storage.read(key: 'roles')=='Аудитор'? UserEnum.auditor:UserEnum.applicant;
      UserData.name=await storage.read(key: 'fullName');
      UserData.email=await storage.read(key: 'email');
      UserData.phone=await storage.read(key: 'phone');
      UserData.region=await storage.read(key: 'region');
      UserData.companyName=await storage.read(key: 'companyName');
    }
    return password != null;
  }

  Future<bool> checkConfirmationCode(String code) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: '$mainPath/check-confirmation-code',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['code'] = code;
    var sendRequest = await request.send();
    var response = await http.Response.fromStream(sendRequest);
    if (response.statusCode == 200) {
      print(response.body);
      final decodeData = jsonDecode(response.body);
      final success = decodeData['success'];
      if (success) {
        print(decodeData['user']['auth_key']);
        await storage.write(
            key: 'authKey', value: decodeData['user']['auth_key']);

        if(decodeData['user']['roles']['auditor'] == 'Аудитор'){
          await storage.write(
              key: 'roles', value: decodeData['user']['roles']['auditor']);
          UserData.userRole=UserEnum.auditor;
          print('auditor');
        }else{
          print('else');
          await storage.write(
              key: 'roles', value: decodeData['user']['roles']['user']);
          UserData.userRole=UserEnum.applicant;
        }
        print(decodeData['user']['roles']['auditor']);
        /*userRole = decodeData['user']['roles']['auditor'] == 'Аудитор'
            ? UserEnum.auditor : UserEnum.applicant;*/
        await storage.write(
            key: 'email', value: decodeData['user']['email']);
        UserData.email=decodeData['user']['email'];
        await storage.write(
            key: 'fullName', value: decodeData['user']['full_name']);
        await storage.write(
            key: 'phone', value: (decodeData['user']['phone']).toString());
        await storage.write(
            key: 'companyName', value: decodeData['user']['company_name']);
        await storage.write(
            key: 'region', value: decodeData['user']['region']);
        UserData.userDataChange(UserDataForChange(companyName: decodeData['user']['company_name'] ?? '', companyDirector: decodeData['user']['full_name'] ?? '', region: decodeData['user']['region'] ?? '', phone: decodeData['user']['phone'] ?? ''));
        UserData().printAllData();

        /*UserData.name=decodeData['user']['full_name'];

        UserData.phone=(decodeData['user']['phone']).toString();
        UserData.region=decodeData['user']['region'];
        UserData.companyName=decodeData['user']['company_name'];

        */

      }
      return success;
    } else {
      print('error');
      print(response.statusCode);
      print(response.request);
      return false;
    }
  }
}
