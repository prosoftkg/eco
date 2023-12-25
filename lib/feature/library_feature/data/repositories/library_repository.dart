import 'package:eco_kg/feature/library_feature/domain/entities/param_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_journal/error_journal.dart';
import '../../domain/entities/filterList_entity.dart';
import '../../domain/entities/library_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/library_server.dart';

@Injectable(as: LibraryRepository)

class LibraryRepositoryImpl implements LibraryRepository{
  final LibraryDataSourse libraryDataSourse;
  LibraryRepositoryImpl({required this.libraryDataSourse});

  Future<Either<Failure, LibraryEntity>> postLibrary(FilterList filterList) {
    return _postLibrary(filterList);
  }

  Future<Either<Failure,LibraryEntity>> _postLibrary(FilterList filterList) async{
    try{
      final library=await libraryDataSourse.postLibrary(filterList);
      return Right(library);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  Future<Either<Failure, ParamEntity>> getParam(String lanCode) {
    return _getParam(lanCode);
  }

  Future<Either<Failure,ParamEntity>> _getParam(String lanCode) async{
    try{
      final param=await libraryDataSourse.getParam(lanCode);
      return Right(param);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  Future<Either<Failure,List<String>>> readHistorySearch() {
    return _readHistorySearch();
  }

  Future<Either<Failure,List<String>>> _readHistorySearch() async{
    try{
      final param=await libraryDataSourse.readHistorySearch();
      return Right(param);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }

  Future<Either<Failure,void>> removeHistorySearch(String removeHistorySearch) {
    return _removeHistorySearch(removeHistorySearch);
  }

  Future<Either<Failure,void>> _removeHistorySearch(String removeHistorySearch) async{
    try{
      final param=await libraryDataSourse.removeHistorySearch(removeHistorySearch);
      return Right(param);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }
}