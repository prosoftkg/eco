import 'package:eco_kg/feature/library_feature/domain/entities/param_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class ParamUseCase extends UseCase<ParamEntity,String>{
  final LibraryRepository libraryRepository;
  ParamUseCase({required this.libraryRepository});

  @override
  Future<Either<Failure, ParamEntity>> call(String lanCode) async{
    return await libraryRepository.getParam(lanCode);
  }
}