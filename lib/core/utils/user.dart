import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../feature/user_cabinet_feature/domain/entities/userDataForChangeLocal.dart';

class UserData {
  static UserEnum userRole = UserEnum.applicant;
  static String userAuthKey = '';
  static String? name;
  static String? email;
  static String? phone;
  static String? companyName;
  static String? region;
  static const List<String> areaCompanyFirst=[
    'До 200 кв.м',
    'От 200 до 400 кв.м',
    'От 400 кв.м и выше'
  ];
  static const List<String> areaCompanySecond=[
    'До 400 кв.м',
    'От 400 до 800 кв.м',
    'От 800 кв.м и выше'
  ];
  static const storage = FlutterSecureStorage();

  static Future<void> userDataChange(UserDataForChange userDataForChange) async {
     UserData.name=userDataForChange.companyDirector;
    UserData.phone=userDataForChange.phone;
    UserData.companyName=userDataForChange.companyName;
    UserData.region=userDataForChange.region;

     await storage.write(
         key: 'fullName', value: userDataForChange.companyDirector);
     await storage.write(
         key: 'phone', value: UserData.phone=userDataForChange.phone);
     await storage.write(
         key: 'companyName', value: userDataForChange.companyName);
     await storage.write(
         key: 'region', value: userDataForChange.region);
  }
  void printAllData(){
    print('${UserData.email},${UserData.name},${UserData.companyName}');
  }
}
