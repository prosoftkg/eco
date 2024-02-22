import 'dart:convert';
import 'package:eco_kg/feature/library_feature/domain/entities/filterList_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../domain/entities/param_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


abstract interface class ILibraryDataSourse {
  Future<LibraryEntity> postLibrary(FilterList filterList);
  Future<ParamEntity> getParam(String lanCode);
  Future<List<String>> readHistorySearch();
  Future<void> removeHistorySearch(String removeHistorySearch);
}

@injectable
class LibraryDataSourse implements ILibraryDataSourse {
  final storage = const FlutterSecureStorage();

  @override
  Future<LibraryEntity> postLibrary(FilterList filterList) async {

    /*var uri = Uri(
      scheme: 'https',
      host: 'pereto.prosoft.kg',
      path: 'api/library/list',
    );*/

    var uri = Uri(
      scheme: schemeLibrary,
      host: ipLibrary,
      path: 'web/api/library/list',
    );

    String? historySearch = await storage.read(key: 'historySearch');
    if(historySearch!=null){
      List<String> historyList=historySearch.split('#');
      Set<String> history=historyList.toSet();
      history.add(filterList.search!);
      String newHistorySearch='';
      for(var temp in history){
        newHistorySearch+='#$temp';
      }
      await storage.write(
          key: 'historySearch', value: newHistorySearch);
    }else if(filterList.search!=''){
      await storage.write(
          key: 'historySearch', value: filterList.search);
    }

    var json={
      'tag':filterList.filterTags.toString().replaceAll('[', '').replaceAll(']', ''),
      'post_type':filterList.filterType.toString().replaceAll('[', '').replaceAll(']', ''),
      'category':filterList.filterCat.toString().replaceAll('[', '').replaceAll(']', ''),
      'theme':filterList.filterTheme.toString().replaceAll('[', '').replaceAll(']', ''),
      'search':filterList.search
    };


    var response = await http.post(uri,body: json);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return LibraryEntity.fromJson(jsonDecode(response.body));
    } else {
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  @override
  Future<ParamEntity> getParam(String lanCode) async {
    var uri = Uri(
      /*scheme: schemeLibrary,
      host: ipLibrary,*/
        scheme: 'https',
        host: 'pereto.prosoft.kg',
      path: 'web/api/library/param-list',
        queryParameters: {'language' : lanCode}
    );

    var response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ParamEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw ServerError(error: response.reasonPhrase!);
    }
  }

  @override
  Future<List<String>> readHistorySearch() async {
    final String? historySearch = await storage.read(key: 'historySearch');
    List<String> historyList=[];
    if(historySearch!=null){
      historyList=historySearch.split('#');
    }
    Set<String> send=historyList.toSet();
    send.remove('');
    send.remove(' ');
    return send.toList().reversed.toList();
  }

  @override
  Future<void> removeHistorySearch(String removeHistory) async {
    String? historySearch = await storage.read(key: 'historySearch');
    if(removeHistory!='removeAll'){
      List<String> historyList = historySearch!.split('#');
      Set<String> history = historyList.toSet();
      history.remove(removeHistory);
      String newHistorySearch = '';
      for (var temp in history) {
        newHistorySearch += '#$temp';
      }
      await storage.write(
          key: 'historySearch', value: newHistorySearch);
    }else{
      await storage.write(
          key: 'historySearch', value: '');
    }
  }
}

