import 'package:eco_kg/feature/library_feature/domain/entities/param_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class HistoryUseCase extends UseCase<List<String>,NoParams>{
  final LibraryRepository libraryRepository;
  HistoryUseCase({required this.libraryRepository});

  @override
  Future<Either<Failure, List<String>>> call(NoParams noParams) async{
    return await libraryRepository.readHistorySearch();
  }
}